using AutoMapper.Configuration.Conventions;
using Microsoft.EntityFrameworkCore;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;

namespace reciWebApp.Data.Repositories
{
    public class SubCollectionRepository : RepositoryBase<SubCollection>, ISubCollectionRepository
    {
        public SubCollectionRepository(ReciContext reciContext) : base(reciContext)
        {
        }

        public string CreateSubCollection(int collectionId)
        {
            var id = DateTime.Now.ToString("yyyyMMddHHmmssffff");
            Create(new SubCollection
            {
                Id = id,
                CollectionId = collectionId,
            });
            return id;
        }

        public Task<List<SubCollection>> GetAllSubCollectionAsync(int collectionId)
        {
            return GetByCondition(x => x.CollectionId == collectionId).Include(x => x.FoodCollections).ToListAsync();
        }
    }
}
