using reciWebApp.Data.Models;
using reciWebApp.Data.Repositories;

namespace reciWebApp.Data.IRepositories
{
    public interface ICategoryRepository
    {
        void CreateCategory(Category category);
        void UpdateCategory(Category category);
        void DeleteCategory(Category category);
        Task<List<Category>?> GetAllCategoryAsync();
        List<Category>? GetAllCategories();
        Category? GetCategoryById(int id);
        List<Category> GetCategoryByName(List<string>? names);
        Category? GetCategoryByName(string name);
    }
}
