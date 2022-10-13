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

        public async Task<User> GetUserByEmailAsync(string email)
        {
            return await GetByCondition(x => x.Email == email).SingleOrDefaultAsync();
        }

        public void CreateUser(User user)
        {
            Create(user);
        }

        public async Task<User> GetUserByIdAsync(int id)
        {
            return await GetByCondition(x => x.Id == id).SingleOrDefaultAsync();
        }

        public User GetUserById(int id)
        {
            return GetByCondition(x => x.Id == id).FirstOrDefault();
        }

        public User GetUserByEmail(string email)
        {
            return GetByCondition(x => x.Email == email).FirstOrDefault();
        }
        public List<User> GetAllUser()
        {
            return GetAll().ToList();
        }
        public async Task<List<User>?> GetAllUserAsync()
        {
            return await GetAll().ToListAsync();
        }
    }
}
    