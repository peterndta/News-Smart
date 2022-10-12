using Microsoft.EntityFrameworkCore;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;

namespace reciWebApp.Data.Repositories
{
    public class UserInteractRepository : RepositoryBase<UserInteract>, IUserInteractRepository
    {
        public UserInteractRepository(ReciContext reciContext) : base(reciContext)
        {
        }

        public double GetAverageRating(string postId)
        {
            var listUserInteract = GetUserInteract(postId).Where(x => x.Rating != null);
            var count = listUserInteract.Count();
            var averageRating = 0;
            if (count > 0)
            {
                var total = 0;
                foreach(var item in listUserInteract)
                {
                    total += item.Rating.Value;
                }
                averageRating = total / count;
            }
            return averageRating;
        }

        public async Task<UserInteract?> GetUserInteractAsync(int userId, string postId)
        {
            return await GetByCondition(x => x.UserId == userId && x.PostsId.Equals(postId)).SingleOrDefaultAsync();
        }

        public List<UserInteract?> GetUserInteract(string postId)
        {
            return GetByCondition(x => x.PostsId.Equals(postId)).ToList();
        }

        public void CreateUserInteract(UserInteract userInteract)
        {
            Create(userInteract);
        }

        public void UpdateUserInteract(UserInteract userInteract)
        {
            Update(userInteract);
        }

        public void DeleteUserInteract(UserInteract userInteract)
        {
            Delete(userInteract);
        }

        public bool CheckBookMark(int userId, string postId)
        {
            var userInteract = GetByCondition(x => x.UserId == userId && x.PostsId.Equals(postId)).FirstOrDefault();
            if (userInteract == null)
            {
                return false;
            }
            return userInteract.Bookmark;
        }

        public int? GetRating(int userId, string postId)
        {
            var userInteract = GetByCondition(x => x.UserId == userId && x.PostsId.Equals(postId)).FirstOrDefault();
            if (userInteract == null)
            {
                return null;
            }
            return userInteract.Rating;
        }
    }
}
