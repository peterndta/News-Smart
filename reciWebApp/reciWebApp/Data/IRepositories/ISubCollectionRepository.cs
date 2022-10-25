using reciWebApp.Data.Models;

namespace reciWebApp.Data.IRepositories
{
    public interface ISubCollectionRepository
    {
        string CreateSubCollection(int collectionId);
        Task<List<SubCollection>> GetAllSubCollectionAsync(int collectionId);
    }
}
