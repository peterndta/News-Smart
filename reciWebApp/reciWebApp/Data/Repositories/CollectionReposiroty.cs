using Microsoft.EntityFrameworkCore;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;

namespace reciWebApp.Data.Repositories
{
    public class CollectionReposiroty : RepositoryBase<Collection>, ICollectionRepository
    {
        public CollectionReposiroty(ReciContext reciContext) : base(reciContext)
        {
        }

        public void CreateCollection(Collection collection)
        {
            Create(collection);
        }

        public Collection GetCollectionByName (string name)
        {
            return GetByCondition(x => x.CollectionName.Equals(name)).SingleOrDefault();
        }

        public async Task<Collection> GetCollectionByNameAsync(string name)
        {
            return await GetByCondition(x => x.CollectionName.Equals(name)).SingleOrDefaultAsync();
        }
    }
}
