using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.VisualBasic;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.Data.Pagination;
using reciWebApp.Data.Repositories.Extensions;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.Services.Commons;
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
            return GetByCondition(x => x.Id.Equals(id) && x.Status == PostStatus.Active).FirstOrDefault();
        }

        public async Task<Post?> GetPostByIdAsync(string id)
        {
            return await GetByCondition(x => x.Id.Equals(id) && x.Status == PostStatus.Active).SingleOrDefaultAsync();
        }

        public async Task<List<Post>> GetPostByUserIdAsync(int id)
        {
            return await GetByCondition(x => x.UserId == id && x.Status == PostStatus.Active).ToListAsync();
        }

        public async Task<List<Post>?> GetAllPostsByUserIdAsync(string? name, int userId)
        {
            var posts = await GetByCondition(x => x.UserId == userId && x.Status == PostStatus.Active)
                .FilterPostByName(_reciContext, name)
                .ToListAsync();
            return posts;
        }

        public List<Post> GetPostsByPostCategories(List<PostCategory> postCategories)
        {
            var posts = GetByCondition(x => x.Status == PostStatus.Active).ToList();
            var result = new List<Post>();
            if (posts.Count > 0 && postCategories.Count > 0)
            {
                postCategories.DistinctBy(x => x.PostId);
                foreach (var postCategory in postCategories)
                {
                    var post = GetPostById(postCategory.PostId);
                    if (post != null)
                    {
                        result.Add(post);
                    }
                }              
            }
            return result;
        }

        public List<Post> GetPostsByCookingMethods(List<CookingMethod> cookingMethods)
        {
            var posts = GetByCondition(x => x.Status == PostStatus.Active).ToList();
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
            var posts = GetByCondition(x => x.Status == PostStatus.Active).ToList();
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
            var posts = GetByCondition(x => x.Status == PostStatus.Active).ToList();
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
            if (condition.Equals(SortTypes.Newest))
            {
                posts = posts.OrderByDescending(x => x.CreateDate).ToList();
            }
            else if (condition.Equals(SortTypes.Oldest))
            {
                posts = posts.OrderBy(x => x.CreateDate).ToList();
            }
            else if (condition.Equals(SortTypes.Popularity))
            {
                posts = posts.OrderByDescending(x => x.AverageRating).ToList();
            }
            return posts;
        }

        public async Task<List<Post>?> GetPostByUserInteractsAsync(List<UserInteract> userInteracts, string? name)
        {
            var result = new List<Post>();
            foreach (var userInteract in userInteracts)
            {
                var post = GetPostById(userInteract.PostsId);
                if (post != null)
                {
                    result.Add(post);
                }
            }
            if (name != null)
            {
                return result.Where(x => x.Name.Contains(name)).ToList();
            }
            return result;
        }

        public async Task<List<Post>?> GetPostsFilterByMethodsAsync(PostParams postParams)
        {
            var posts = GetByCondition(x => x.Status == PostStatus.Active).ToList();
            if (postParams.PostsByCookingMethods != null)
            {
                posts = (posts.Intersect(postParams.PostsByCookingMethods)).ToList();
            }

            if (postParams.Name != null)
            {
                posts = posts.Where(x => x.Name.Contains(postParams.Name)).ToList();
            }
            return posts;
        }

        public async Task<List<Post>?> GetPostsFilterByCategoriesAsync(PostParams postParams)
        {
            var posts = GetByCondition(x => x.Status == PostStatus.Active).ToList();
            if (postParams.PostsByCategories != null)
            {
                posts = posts.Intersect(postParams.PostsByCategories).ToList();
            }

            if (postParams.Name != null)
            {
                posts = posts.Where(x => x.Name.Contains(postParams.Name)).ToList();
            }
            return posts;
        }

        public async Task<List<Post>?> GetPostsFilterByUsesAndRegionsAsync(PostParams postParams)
        {
            var posts = GetByCondition(x => x.Status == PostStatus.Active).ToList();
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
        }

        public async Task<List<Post>?> GetPostByNameAsync(PostFilterByNameParams postFilterByNameParams)
        {
            return await GetByCondition(x => x.Status == PostStatus.Active).FilterPostByName(_reciContext, postFilterByNameParams.Search).ToListAsync();
        }

        public List<Post> GetPostByFoodCollection(List<FoodCollection> foodCollections)
        {
            var posts = GetByCondition(x => x.Status == PostStatus.Active).ToList();
            var result = new List<Post>();
            if (posts.Count > 0 && foodCollections.Count > 0)
            {
                foodCollections.DistinctBy(x => x.PostsId);
                foreach (var foodCollection in foodCollections)
                {
                    var post = GetPostById(foodCollection.PostsId);
                    if (post != null)
                    {
                        result.Add(post);
                    }
                }
            }
            return result;
        }

        public List<Post>? GetPostFilter(List<Post>? post, string? name)
        {
            var allPosts = GetByCondition(x => x.Status == PostStatus.Active).ToList();
            if (post != null)
            {
                allPosts = (allPosts.Intersect(post)).ToList();
            }

            if (name != null)
            {
                allPosts = allPosts.Where(x => x.Name.Contains(name)).ToList();
            }
            return allPosts;
        }

        public async Task<List<Post>> GetBannedPostByUserIdAsync(int id)
        {
            var listBannedPost = GetByCondition(x => x.UserId == id && x.Status == PostStatus.Ban).ToListAsync();
            return await listBannedPost;
        }
    }
}
