using reciWebApp.Data.Models;
using reciWebApp.DTOs;
using reciWebApp.DTOs.UserDTOs;

namespace reciWebApp.Data.IRepositories
{
    public interface IUserRepository
    {
        Task<User> GetUserByEmailAsync(string email);
        Task<User?> GetUserByIdAsync(int id);
        void CreateUser(User user);
        User? GetUserById(int id);
        User? GetUserByEmail(string email);
        List<User> GetAllUser();
        Task<List<User>>? SearchUserAsync (string search);
        List<User> SearchUser (string search);
        Task<List<User>?> GetAllUserAsync(UserParams userParams);
        Task<int> TotalAccountsAsync();
        IQueryable<TopUserHighRating> GetTopUserHighRatings(int topNumber, IQueryable<UserInteract> userInteracts, IQueryable<Post> posts);  
        IQueryable<TopUserMostPosts> GetTopUserMostPost(IQueryable<GetTopUserHaveMostPost> posts);
    }
}
