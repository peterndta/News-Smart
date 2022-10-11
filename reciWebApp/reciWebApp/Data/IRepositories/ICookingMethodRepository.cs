using reciWebApp.Data.Models;

namespace reciWebApp.Data.IRepositories
{
    public interface ICookingMethodRepository
    {
        void CreateCookingMethod(CookingMethod cookingMethod);
        void UpdateCookingMethod(CookingMethod cookingMethod);  
        void DeleteCookingMethod(CookingMethod cookingMethod);
        Task<List<CookingMethod>?> GetAllCookingMethodsAsync();
        CookingMethod? GetCookingMethodById(int id);
        int? GetCookingMethodIdByName(string? name);
    }
}
