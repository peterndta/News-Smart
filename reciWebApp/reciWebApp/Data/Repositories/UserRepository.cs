using Microsoft.EntityFrameworkCore;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;

namespace reciWebApp.Data.Repositories
{
    public class UserRepository : RepositoryBase<User>, IUserRepository
    {
        public UserRepository(ReciContext reciContext) : base(reciContext)
        {
        }

        public async Task<User> GetUserAsync(string email)
        {
            return await GetByCondition(x => x.Email == email).SingleOrDefaultAsync();
        }

        public void CreateUser(User user)
        {
            Create(user);
            _reciContext.SaveChanges();
        }
    }
}
    