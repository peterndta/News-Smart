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
    }
}
