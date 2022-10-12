using reciWebApp.Data.Models;

namespace reciWebApp.Data.IRepositories
{
    public interface IUsesRepository
    {
        Task<List<Use>?> GetAllUseAsync();
        List<Use?> GetUsesByName(List<string?> names);
    }
}
