using Microsoft.EntityFrameworkCore;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;

namespace reciWebApp.Data.Repositories
{
    public class UsesRepository : RepositoryBase<Use>, IUsesRepository
    {
        public UsesRepository(ReciContext reciContext) : base(reciContext)
        {
        }

        public async Task<List<Use>?> GetAllUseAsync()
        {
            return await GetAll().ToListAsync();
        }
    }
}
