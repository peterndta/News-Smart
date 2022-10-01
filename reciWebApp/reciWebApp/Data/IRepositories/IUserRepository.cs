using reciWebApp.Data.Models;

namespace reciWebApp.Data.IRepositories
{
    public interface IUserRepository
    {
        Task<User> GetUserAsync(string email);
        Task<User> GetUserByIdAsync(int id);
        void CreateUser(User user);
    }
}
