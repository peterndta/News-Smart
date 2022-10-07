using reciWebApp.Data.Models;

namespace reciWebApp.Data.IRepositories
{
    public interface IRecipeRegionRepository
    {
        void CreateRecipeRegion(RecipeRegion recipeRegion);
        void UpdateRecipeRegion(RecipeRegion recipeRegion); 
        void DeleteRecipeRegion(RecipeRegion recipeRegion);
        Task<List<RecipeRegion>?> GetAllRecipeRegionsAsync();
    }
}
