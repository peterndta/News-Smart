using reciWebApp.Data.Models;
using reciWebApp.DTOs.UserDTOs;

namespace reciWebApp.Data.IRepositories
{
    public interface IUserRepository
    {
        Task<User> GetUserByEmailAsync(string email);
        Task<User> GetUserByIdAsync(int id);
        void CreateUser(User user);
        User GetUserById(int id);
        User GetUserByEmail(string email);
        List<User> GetAllUser();
        Task<List<User>?> GetAllUserAsync(UserParams userParams);
    }
}
