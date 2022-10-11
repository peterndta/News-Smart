using Microsoft.EntityFrameworkCore;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;

namespace reciWebApp.Data.Repositories
{
    public class CategoryRepository : RepositoryBase<Category>, ICategoryRepository
    {
        public CategoryRepository(ReciContext reciContext) : base(reciContext)
        {
        }

        public void CreateCategory(Category category)
        {
            Create(category);
        }

        public void DeleteCategory(Category category)
        {
            Delete(category);
        }

        public List<Category>? GetAllCategories()
        {
            return GetAll().ToList();
        }

        public async Task<List<Category>?> GetAllCategoryAsync()
        {
            return await GetAll().ToListAsync();
        }

        public Category? GetCategoryById(int id)
        {
            return GetByCondition(x => x.Id == id).FirstOrDefault();
        }

        public List<Category?> GetCategoryByName(List<string>? names)
        {
            var categories = GetAllCategories();
            List<Category> result = new List<Category>();
            if (names != null && categories.Count > 0)
            {
                foreach (var name in names)
                {
                    result.AddRange(categories.Where(x => x.Type.Equals(name)).ToList());
                }
                return result;
            }
            return categories;
        }

        public void UpdateCategory(Category category)
        {
            Update(category);
        }
    }
}
