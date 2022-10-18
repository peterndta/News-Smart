using reciWebApp.Data.Models;

namespace reciWebApp.Data.IRepositories
{
    public interface IPostCategoryRepository
    {
        void CreatePostCategory(PostCategory postCategory);
        List<PostCategory> GetPostCategoriesByPostId(string id);
        List<PostCategory> GetPostCategoriesByCategory(List<Category> categories);
        List<PostCategory>? GetAllPostCategories();
    }
}