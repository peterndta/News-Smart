using reciWebApp.Data.Models;

namespace reciWebApp.Data.IRepositories
{
    public interface IFoodCollectionRepository
    {
        void CreateFoodCollection(FoodCollection foodCollection);
        Task<List<FoodCollection>> GetFoodCollectionsAsync(int collectionId);
        List<FoodCollection> GetFoodCollectionsByPostId(string postId);
        Task<List<FoodCollection>> GetFoodCollectionAsync(string postId, int collectionId);
        void BulkDeleteFoodCollection(List<FoodCollection> foodCollections);
    }
}
