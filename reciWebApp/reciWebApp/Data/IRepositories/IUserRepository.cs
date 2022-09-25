using reciWebApp.Data.Models;

namespace reciWebApp.Data.IRepositories
{
    public interface IUserRepository
    {
        Task<User> GetUserAsync(string email);
        void CreateUser(User user);
    }
}
