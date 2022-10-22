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

        public List<FoodCollection> GetFoodCollectionsByCollections(List<Collection> collections)
        {
            var foodCollections = new List<FoodCollection>();
            if (collections.Count > 0)
            {
                foreach (var collection in collections)
                {
                    foodCollections.AddRange(GetByCondition(x => x.CollectionId == collection.Id));
                }
            }
            return foodCollections;
        }
    }
}
