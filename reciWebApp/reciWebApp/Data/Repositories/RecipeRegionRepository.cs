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

        public List<RecipeRegion> GetRecipeRegionsByName(List<string>? names)
        {
            var recipeRegions = GetAll().ToList();
            var result = new List<RecipeRegion>();
            if (names != null && recipeRegions.Count > 0)
            {
                foreach (var name in names)
                {
                    var validResult = GetByCondition(x => x.Continents.Equals(name)).FirstOrDefault();
                    if (validResult != null)
                    {
                        result.Add(validResult);
                    }
                }
            }
            return result;
        }

        public void UpdateRecipeRegion(RecipeRegion recipeRegion)
        {
            Update(recipeRegion);
        }
    }
}
