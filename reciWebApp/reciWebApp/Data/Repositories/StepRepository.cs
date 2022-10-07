using Microsoft.EntityFrameworkCore;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.Data.Pagination;
using reciWebApp.Data.Repositories.Extensions;
using reciWebApp.Services.Utils;

namespace reciWebApp.Data.Repositories
{
    public class StepRepository : RepositoryBase<Step>, IStepRepository
    {
        public StepRepository(ReciContext reciContext) : base (reciContext){}

        public void CreateStep (Step step)
        {
            Create(step);
        }

        public Step GetStepById (int id)
        {
            return GetByCondition(x => x.Id.Equals(id)).FirstOrDefault();
        }
        public async void UpdateStep (Step step)
        {
            Update(step);
        }

        public async Task<Step> GetStepByIdAsync(int id)
        {
            return await GetByCondition(x => x.Id.Equals(id)).SingleOrDefaultAsync();
        }
        
        public async Task<List<Step>> GetStepByPostIdAsync(string id)
        {
            return await GetByCondition(x => x.PostsId == id).ToListAsync();
        }

    }
}