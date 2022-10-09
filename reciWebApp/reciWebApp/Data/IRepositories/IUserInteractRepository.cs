using reciWebApp.Data.Models;

namespace reciWebApp.Data.IRepositories
{
    public interface IUserInteractRepository
    {
        double GetAverageRating(string postId);
        Task<UserInteract?> GetUserInteractAsync(int useId, string postId);
        List<UserInteract?> GetUserInteract(string postId);
    }
}
