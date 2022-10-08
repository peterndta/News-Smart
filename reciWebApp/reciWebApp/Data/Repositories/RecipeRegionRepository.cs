using Microsoft.EntityFrameworkCore;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;

namespace reciWebApp.Data.Repositories
{
    public class RecipeRegionRepository : RepositoryBase<RecipeRegion>, IRecipeRegionRepository
    {
        public RecipeRegionRepository(ReciContext reciContext) : base(reciContext)
        {
        }

        public void CreateRecipeRegion(RecipeRegion recipeRegion)
        {
            Create(recipeRegion);
        }

        public void DeleteRecipeRegion(RecipeRegion recipeRegion)
        {
            Delete(recipeRegion);
        }

        public async Task<List<RecipeRegion>?> GetAllRecipeRegionsAsync()
        {
            return await GetAll().ToListAsync();
        }

        public RecipeRegion? GetRecipeRegionsById(int id)
        {
            return GetByCondition(x => x.Id == id).FirstOrDefault();
        }

        public void UpdateRecipeRegion(RecipeRegion recipeRegion)
        {
            Update(recipeRegion);
        }
    }
}
