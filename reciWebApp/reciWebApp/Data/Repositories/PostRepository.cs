using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.VisualBasic;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.Data.Pagination;
using reciWebApp.Data.Repositories.Extensions;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.Services.Utils;

namespace reciWebApp.Data.Repositories
{
    public class PostRepository : RepositoryBase<Post>, IPostRepository
    {
        public PostRepository(ReciContext reciContext) : base(reciContext)
        {
        }

        public void CreatePost(Post post)
        {
            Create(post);
        }

        public void DeletePost(Post post)
        {
            Delete(post);
        }

        public void UpdatePost(Post post)
        {
            Update(post);
        }

        public Post? GetPostById(string id)
        {
            return GetByCondition(x => x.Id.Equals(id)).FirstOrDefault();
        }

        public async Task<Post?> GetPostByIdAsync(string id)
        {
            return await GetByCondition(x => x.Id.Equals(id)).SingleOrDefaultAsync();
        }

        public async Task<List<Post>?> GetPostByUserIdAsync(int id)
        {
            return await GetByCondition(x => x.UserId == id).ToListAsync();
        }

        //public async Task<List<Post>?> GetAllPostsAsync(PostParams postParams)
        //{
        //    var posts =  GetAll().ToList();
        //    if (postParams.PostsByCategories != null)
        //    {
        //        posts = posts.Intersect(postParams.PostsByCategories).ToList();
        //    }
        //    if (postParams.PostsByCookingMethods != null)
        //    {
        //        posts = (posts.Intersect(postParams.PostsByCookingMethods)).ToList();
        //    }
        //    if (postParams.PostsByCollections != null)
        //    {
        //        posts = (posts.Intersect(postParams.PostsByCollections)).ToList();
        //    }
        //    if (postParams.PostsRecipeRegions != null && postParams.PostsByUses != null)
        //    {
        //        posts = (posts.Intersect(postParams.PostsRecipeRegions)).ToList();
        //        posts = posts.Union(postParams.PostsByUses).DistinctBy(x => x.Id).ToList();
        //    }            
        //    else if (postParams.PostsRecipeRegions != null && postParams.PostsByUses == null)
        //    {
        //        posts = (posts.Intersect(postParams.PostsRecipeRegions)).ToList();
        //    }
        //    else if (postParams.PostsRecipeRegions == null && postParams.PostsByUses != null)
        //    {
        //        posts = posts.Intersect(postParams.PostsByUses).ToList();
        //    }
        //    if (postParams.Name != null)
        //    {
        //        posts = posts.Where(x => x.Name.Contains(postParams.Name)).ToList();
        //    }
        //    return posts;
        //}

        public async Task<List<Post>?> GetAllPostsByUserIdAsync(string? name, int userId)
        {
            var posts = await GetByCondition(x => x.UserId == userId)
                .FilterPostByName(_reciContext, name)
                .ToListAsync();
            return posts;
        }

        public List<Post> GetPostsByPostCategories(List<PostCategory> postCategories)
        {
            var posts = GetAll().ToList();
            var result = new List<Post>();
            if (posts.Count > 0 && postCategories.Count > 0)
            {
                postCategories.DistinctBy(x => x.PostId);
                foreach (var postCategory in postCategories)
                {
                    result.Add(GetPostById(postCategory.PostId));
                }              
            }
            return result;
        }

        public List<Post> GetPostsByCookingMethods(List<CookingMethod> cookingMethods)
        {
            var posts = GetAll().ToList();
            var result = new List<Post>();
            if (posts.Count > 0 && cookingMethods.Count > 0)
            {
                foreach (var cookingMethod in cookingMethods)
                {
                    var validResult = posts.Where(x => x.CookingMethodId == cookingMethod.Id).ToList();
                    if (validResult != null)
                    {
                        result.AddRange(validResult);
                    }
                }
            }
            return result;
        }

        public List<Post> GetPostsByRecipeRegions(List<RecipeRegion> recipeRegions)
        {
            var posts = GetAll().ToList();
            var result = new List<Post>();
            if (posts.Count > 0 && recipeRegions.Count > 0)
            {
                foreach (var recipeRegion in recipeRegions)
                {
                    result.AddRange(GetByCondition(x => x.RecipeRegionId == recipeRegion.Id).ToList());
                }
            }
            return result;
        }

        public List<Post> GetPostsByUses(List<Use> uses)
        {
            var posts = GetAll().ToList();
            var result = new List<Post>();
            if (posts.Count > 0 && uses.Count > 0)
            {
                foreach (var use in uses)
                {
                    result.AddRange(GetByCondition(x => x.UsesId == use.Id).ToList());
                }
            }
            return result;
        }

        public List<ShowPostDTO> SortPostByCondition(List<ShowPostDTO> posts, string? condition)
        {
            if (condition.Equals("Newest"))
            {
                posts = posts.OrderByDescending(x => x.CreateDate).ToList();
            }
            else if (condition.Equals("Oldest"))
            {
                posts = posts.OrderBy(x => x.CreateDate).ToList();
            }
            else if (condition.Equals("Popularity"))
            {
                posts = posts.OrderByDescending(x => x.AverageRating).ToList();
            }
            return posts;
        }

        public async Task<List<Post>?> GetPostByUserInteractsAsync(List<UserInteract> userInteracts, string? name)
        {
            var posts = await GetAll().FilterPostByName(_reciContext, name).ToListAsync();
            List<Post> result = new List<Post>();
            foreach (var userInteract in userInteracts)
            {
                result.Add(posts.Where(x => x.Id == userInteract.PostsId).First());
            }
            return result;
        }

        public List<Post> GetPostsByFoodCollections(List<FoodCollection> foodCollections)
        {
            var posts = new List<Post>();
            if (foodCollections.Count > 0)
            {
                foodCollections = foodCollections.DistinctBy(x => x.PostsId).ToList();
                foreach (var foodCollection in foodCollections)
                {
                    var validResult = GetByCondition(x => x.Id.Equals(foodCollection.PostsId)).FirstOrDefault();
                    if (validResult != null)
                    {
                        posts.Add(validResult);
                    }                   
                }
            }
            return posts;
        }

        public async Task<List<Post>?> GetPostsFilterByMethodsAsync(PostParams postParams)
        {
            var posts = GetAll();
            if (postParams.PostsByCookingMethods != null)
            {
                posts = (posts.Intersect(postParams.PostsByCookingMethods));
            }

            if (postParams.Name != null)
            {
                posts = posts.Where(x => x.Name.Contains(postParams.Name));
            }
            return await posts.ToListAsync();
        }

        public async Task<List<Post>?> GetPostsFilterByCategoriesAsync(PostParams postParams)
        {
            var posts = GetAll();
            if (postParams.PostsByCategories != null)
            {
                posts = posts.Intersect(postParams.PostsByCategories);
            }

            if (postParams.Name != null)
            {
                posts = posts.Where(x => x.Name.Contains(postParams.Name));
            }
            return await posts.ToListAsync();
        }

        public async Task<List<Post>?> GetPostsFilterByUsesAndRegionsAsync(PostParams postParams)
        {
            var posts = GetAll();
            if (postParams.PostsRecipeRegions != null && postParams.PostsByUses != null)
            {
                posts = (posts.Intersect(postParams.PostsRecipeRegions));
                posts = posts.Union(postParams.PostsByUses).DistinctBy(x => x.Id);
            }
            else if (postParams.PostsRecipeRegions != null && postParams.PostsByUses == null)
            {
                posts = (posts.Intersect(postParams.PostsRecipeRegions));
            }
            else if (postParams.PostsRecipeRegions == null && postParams.PostsByUses != null)
            {
                posts = posts.Intersect(postParams.PostsByUses);
            }
            if (postParams.Name != null)
            {
                posts = posts.Where(x => x.Name.Contains(postParams.Name));
            }
            return await posts.ToListAsync();
        }

        public async Task<List<Post>?> GetPostOfAllCollectionsAsync()
        {
            return await GetAll().ToListAsync();
        }

        public async Task<List<Post>?> GetPostByNameAsync(PostFilterByNameParams postFilterByNameParams)
        {
            return await GetAll().FilterPostByName(_reciContext, postFilterByNameParams.Name).ToListAsync();
        }
    }
}
