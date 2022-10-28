using reciWebApp.Data.Models;

namespace reciWebApp.Data.IRepositories
{
    public interface IFoodCollectionRepository
    {
        void CreateFoodCollection(FoodCollection foodCollection);
        Task<List<FoodCollection>> GetFoodCollectionsAsync(string subCollectionId);
        Task<List<FoodCollection>> GetFoodCollectionAsync();
    }
}
