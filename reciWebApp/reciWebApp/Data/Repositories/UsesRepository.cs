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

        public List<Use?> GetUsesByName(List<string?> names)
        {
            var uses = GetAll().ToList();
            List<Use> result = new List<Use>();
            if (names != null && uses.Count > 0)
            {
                foreach (var name in names)
                {
                    result.Add(uses.Where(x => x.UsesOfFood.Equals(name)).FirstOrDefault());
                }
                return result;
            }
            return uses;
        }

        public Use GetUsesByNameSingle (string name)
        {
            return GetByCondition(x => x.UsesOfFood.Equals(name)).SingleOrDefault();
        }

        public void CreateUse (Use use)
        {
            Create(use);
        }
    }
}
