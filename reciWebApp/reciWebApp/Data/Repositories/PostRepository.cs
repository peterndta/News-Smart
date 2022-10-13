using Microsoft.EntityFrameworkCore;
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

        public Post GetPostById(string id)
        {
            return GetByCondition(x => x.Id.Equals(id)).FirstOrDefault();
        }

        public async Task<Post> GetPostByIdAsync(string id)
        {
            return await GetByCondition(x => x.Id.Equals(id)).SingleOrDefaultAsync();
        }

        public async Task<List<Post>?> GetPostByUserIdAsync(int id)
        {
            return await GetByCondition(x => x.UserId == id).ToListAsync();
        }

        public async Task<List<Post>?> GetAllPostsAsync(PostParams postParams)
        {
            var posts =  GetAll().ToList();
            if (postParams.PostsByCategories != null)
            {
                posts = posts.Intersect(postParams.PostsByCategories).ToList();
            }
            if (postParams.PostsByCookingMethods != null)
            {
                posts = (posts.Intersect(postParams.PostsByCookingMethods)).ToList();
            }
            if (postParams.PostsRecipeRegions != null && postParams.PostsByUses != null)
            {
                posts = (posts.Intersect(postParams.PostsRecipeRegions)).ToList();
                posts = posts.Union(postParams.PostsByUses).DistinctBy(x => x.Id).ToList();
            }            
            else if (postParams.PostsRecipeRegions != null && postParams.PostsByUses == null)
            {
                posts = (posts.Intersect(postParams.PostsRecipeRegions)).ToList();
            }
            else if (postParams.PostsRecipeRegions == null && postParams.PostsByUses != null)
            {
                posts = posts.Intersect(postParams.PostsByUses).ToList();
            }
            if (postParams.Name != null)
            {
                posts = posts.Where(x => x.Name.Contains(postParams.Name)).ToList();
            }
            return posts;
            //return PaginatedList<Post>.Create(posts, postParams.PageNumber, postParams.PageSize);
        }

        public async Task<List<Post>?> GetAllPostsByUserIdAsync(string? name, int userId)
        {
            var posts = await GetByCondition(x => x.UserId == userId)
                .FilterPostByName(_reciContext, name)
                .ToListAsync();
            return posts;
        }

        public List<Post>? GetPostsByPostCategories(List<PostCategory?> postCategories)
        {
            var posts = GetAll().ToList();
            if (posts.Count > 0 && postCategories.Count > 0)
            {
                List<Post> result = new List<Post>();
                postCategories.DistinctBy(x => x.PostId);
                foreach (var postCategory in postCategories)
                {
                    result.Add(GetPostById(postCategory.PostId));
                }
                return result.DistinctBy(x => x.Id).ToList();
            }
            return posts;
        }

        public List<Post>? GetPostsByCookingMethods(List<CookingMethod> cookingMethods)
        {
            var posts = GetAll().ToList();
            if (posts.Count > 0 && cookingMethods.Count > 0)
            {
                List<Post> result = new List<Post>();
                foreach (var cookingMethod in cookingMethods)
                {
                    var invalidResult = posts.Where(x => x.CookingMethodId == cookingMethod.Id);
                    if (invalidResult != null)
                    {
                        result.AddRange(invalidResult);
                    }
                }
                return result.ToList();
            }
            return posts;
        }

        public List<Post>? GetPostsByRecipeRegions(List<RecipeRegion> recipeRegions)
        {
            var posts = GetAll().ToList();
            if (posts.Count > 0 && recipeRegions.Count > 0)
            {
                List<Post> result = new List<Post>();
                foreach (var recipeRegion in recipeRegions)
                {
                    result.AddRange(GetByCondition(x => x.RecipeRegionId == recipeRegion.Id).ToList());
                }
                return result;
            }
            return posts;
        }

        public List<Post>? GetPostsByUses(List<Use> uses)
        {
            var posts = GetAll().ToList();
            if (posts.Count > 0 && uses.Count > 0)
            {
                List<Post> result = new List<Post>();
                foreach (var use in uses)
                {
                    result.AddRange(GetByCondition(x => x.UsesId == use.Id).ToList());
                }
                return result;
            }
            return posts;
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
    }
}
