using reciWebApp.Data.Models;

namespace reciWebApp.Data.IRepositories
{
    public interface IUserRepository
    {
        Task<User> GetUserByEmailAsync(string email);
        Task<User> GetUserByIdAsync(int id);
        void CreateUser(User user);
        User GetUserById(int id);
        User GetUserByEmail(string email);
    }
}
