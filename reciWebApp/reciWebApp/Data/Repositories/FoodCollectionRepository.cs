using Microsoft.EntityFrameworkCore;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;

namespace reciWebApp.Data.Repositories
{
    public class FoodCollectionRepository : RepositoryBase<FoodCollection>, IFoodCollectionRepository
    {
        public FoodCollectionRepository(ReciContext reciContext) : base(reciContext)
        {
        }

        public void CreateFoodCollection(FoodCollection foodCollection)
        {
            Create(foodCollection);
        }

        public async Task<List<FoodCollection>> GetFoodCollectionsAsync(int collectionId)
        {
            return await GetByCondition(x => x.CollectionId == collectionId).ToListAsync();
        }

        public List<FoodCollection> GetFoodCollectionsByPostId(string postId)
        {
            return GetByCondition(x => x.PostsId.Equals(postId)).ToList();
        }

        public async Task<FoodCollection?> GetFoodCollectionAsync(string postId, int collectionId)
        {
            return await GetByCondition(x => x.PostsId.Equals(postId) && x.CollectionId == collectionId).SingleOrDefaultAsync();
        }

        public void BulkDeleteFoodCollection(List<FoodCollection> foodCollections)
        {
            BulkDelete(foodCollections);
        }
    }
}
