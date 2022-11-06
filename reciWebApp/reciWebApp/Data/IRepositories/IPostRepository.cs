using reciWebApp.Data.Models;
using reciWebApp.Data.Pagination;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.DTOs.UserDTOs;
using reciWebApp.Services.Utils;

namespace reciWebApp.Data.IRepositories
{
    public interface IPostRepository
    {
        Task<Post?> GetActivePostByIdAsync(string id);
        Task<Post?> GetBannedPostByIdAsync(string id);
        Task<List<Post>> GetActivePostByUserIdAsync(int id);
        Task<List<Post>> GetBannedPostByUserIdAsync(int id);
        void CreatePost(Post post);
        Post? GetPostById(string id);
        void DeletePost(Post post); 
        void UpdatePost(Post post);
        List<Post> GetPostsByPostCategories(List<PostCategory> postCategories);
        List<Post> GetPostsByCookingMethods(List<int> cookingMethods);
        List<Post> GetPostsByRecipeRegions(List<RecipeRegion> recipeRegions);
        List<Post> GetPostsByUses(List<Use> uses);
        List<ShowPostDTO> SortPostByCondition(List<ShowPostDTO> posts, string? condition);
        Task<List<Post>?> GetPostsFilterByMethodsAsync(PostParams postParams);
        Task<List<Post>?> GetPostsFilterByCategoriesAsync(PostParams postParams);
        Task<List<Post>?> GetPostsFilterByUsesAndRegionsAsync(PostParams postParams);
        Task<List<Post>?> GetAllPostsByUserIdAsync(string? name, int userId);
        Task<List<Post>?> GetPostByUserInteractsAsync(List<UserInteract> userInteracts, string? name);
        Task<List<Post>?> GetPostByNameAsync(PostFilterByNameParams postFilterByNameParams);
        List<Post> GetPostByFoodCollection(List<FoodCollection> foodCollections);
        List<Post>? GetPostFilter(List<Post>? post, string? name);
        Task<int> TotalPostsAsync();
        List<Post> SearchByName(List<Post> posts, string name);
        IQueryable<Post> GetAllActivePost();
        IQueryable<GetTopUserHaveMostPost> GetTopUserHaveMostPost(int topNumber);
    }
}
