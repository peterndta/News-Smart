using reciWebApp.Data.Models;
using reciWebApp.Data.Pagination;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.Services.Utils;

namespace reciWebApp.Data.IRepositories
{
    public interface IPostRepository
    {
        Task<Post?> GetPostByIdAsync(string id);
        Task<List<Post>?> GetPostByUserIdAsync(int id);
        void CreatePost(Post post);
        Post? GetPostById(string id);
        void DeletePost(Post post); 
        void UpdatePost(Post post);
        List<Post> GetPostsByPostCategories(List<PostCategory> postCategories);
        List<Post> GetPostsByCookingMethods(List<CookingMethod> cookingMethods);
        List<Post> GetPostsByRecipeRegions(List<RecipeRegion> recipeRegions);
        List<Post> GetPostsByFoodCollections(List<FoodCollection> foodCollections);
        List<Post> GetPostsByUses(List<Use> uses);
        List<ShowPostDTO> SortPostByCondition(List<ShowPostDTO> posts, string? condition);
        //Task<List<Post>?> GetAllPostsAsync(PostParams postParams);
        Task<List<Post>?> GetPostsFilterByMethodsAsync(PostParams postParams);
        Task<List<Post>?> GetPostsFilterByCategoriesAsync(PostParams postParams);
        Task<List<Post>?> GetPostsFilterByUsesAndRegionsAsync(PostParams postParams);
        Task<List<Post>?> GetAllPostsByUserIdAsync(string? name, int userId);
        Task<List<Post>?> GetPostByUserInteractsAsync(List<UserInteract> userInteracts, string? name);
        Task<List<Post>?> GetPostByNameAsync(PostFilterByNameParams postFilterByNameParams);
    }
}
