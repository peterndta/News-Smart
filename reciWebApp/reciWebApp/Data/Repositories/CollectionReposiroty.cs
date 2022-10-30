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

        public Collection? GetCollection(int id)
        {
            return GetByCondition(x => x.Id == id).SingleOrDefault();
        }

        public Task<Collection?> GetCollectionAsync(int id)
        {
            return GetByCondition(x => x.Id == id).SingleOrDefaultAsync();
        }

        public Collection? GetCollectionByName (string name)
        {
            return GetByCondition(x => x.CollectionName.Equals(name)).SingleOrDefault();
        }

        public async Task<Collection?> GetCollectionByNameAsync(string name)
        {
            return await GetByCondition(x => x.CollectionName.Equals(name)).SingleOrDefaultAsync();
        }

        public Task<List<Collection>> GetCollectionsAsync()
        {
            return GetAll().ToListAsync();
        }

        public List<Collection> GetCollectionsByNames(List<string?> names)
        {
            var collections = new List<Collection>();
            foreach (var name in names)
            {
                var collection = GetByCondition(x => x.CollectionName.Equals(name)).FirstOrDefault();
                if (collection != null)
                {
                    collections.Add(collection);
                }
            }
            return collections;
        }
    }
}
