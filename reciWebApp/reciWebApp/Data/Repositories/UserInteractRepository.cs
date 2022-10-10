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

        public async Task<UserInteract?> GetUserInteractAsync(int useId, string postId)
        {
            return await GetByCondition(x => x.UserId == useId && x.PostsId.Equals(postId)).SingleOrDefaultAsync();
        }

        public List<UserInteract?> GetUserInteract(string postId)
        {
            return GetByCondition(x => x.PostsId.Equals(postId)).ToList();
        }
    }
}
