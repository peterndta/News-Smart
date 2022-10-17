using reciWebApp.Data.Models;

namespace reciWebApp.Data.IRepositories
{
    public interface IUserInteractRepository
    {
        double GetAverageRating(string postId);
        Task<UserInteract?> GetUserInteractAsync(int userId, string postId);
        List<UserInteract>? GetUserInteract(string postId);
        void CreateUserInteract(UserInteract userInteract);
        void UpdateUserInteract(UserInteract userInteract);
        void DeleteUserInteract(UserInteract userInteract);
        bool CheckBookMark(int userId, string postId);
        int? GetRating(int userId, string postId);
        Task<List<UserInteract>>? GetBookmarkAsync(int userId);
        Task<List<UserInteract>>? GetRatingAsync(int userId);
    }
}
