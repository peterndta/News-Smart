using Microsoft.EntityFrameworkCore;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;

namespace reciWebApp.Data.Repositories
{
    public class CookingMethodRepository : RepositoryBase<CookingMethod>, ICookingMethodRepository
    {
        public CookingMethodRepository(ReciContext reciContext) : base(reciContext)
        {
        }

        public void CreateCookingMethod(CookingMethod cookingMethod)
        {
            Create(cookingMethod);
        }

        public void DeleteCookingMethod(CookingMethod cookingMethod)
        {
            Delete(cookingMethod);
        }

        public async Task<List<CookingMethod>?> GetAllCookingMethodsAsync()
        {
            return await GetAll().ToListAsync();
        }

        public CookingMethod? GetCookingMethodById(int id)
        {
            return GetByCondition(x => x.Id == id).FirstOrDefault();
        }

        public int? GetCookingMethodIdByName(string? name)
        {
            return string.IsNullOrWhiteSpace(name)
                ? null
                : GetByCondition(x => x.Method.Equals(name)).FirstOrDefault().Id;
        }

        public void UpdateCookingMethod(CookingMethod cookingMethod)
        {
            Update(cookingMethod);
        }
    }
}
