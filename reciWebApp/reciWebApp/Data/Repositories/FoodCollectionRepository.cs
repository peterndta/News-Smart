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

        public Task<List<FoodCollection>> GetFoodCollectionAsync()
        {
            return GetAll().ToListAsync();
        }

        public async Task<List<FoodCollection>> GetFoodCollectionsAsync(string subCollectionId)
        {
            return await GetByCondition(x => x.SubCollectionId.Equals(subCollectionId)).ToListAsync();
        }
    }
}
