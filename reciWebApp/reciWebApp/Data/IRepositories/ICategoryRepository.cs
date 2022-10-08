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
        Category? GetCategoryById(int id);
    }
}
