using reciWebApp.Data.Models;
using reciWebApp.Data.Repositories;

namespace reciWebApp.Data.IRepositories
{
    public interface ICollectionRepository
    {
        void CreateCollection (Collection collection);
        Collection GetCollectionByName (string name);
        Task<Collection> GetCollectionByNameAsync (string name);
    }
}
