using Microsoft.EntityFrameworkCore;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.DTOs.BookmarkDTOs;
using reciWebApp.DTOs.UserInteractDTOs;
using System.Collections.Immutable;

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

        public List<UserInteract>? GetUserInteract(string postId)
        {
            return GetByCondition(x => x.PostsId.Equals(postId)).ToList();
        }

        public void CreateUserInteract(UserInteract userInteract)
        {
            Create(userInteract);
        }

        public void UpdateUserInteract(UserInteract userInteract)
        {
            //Update(userInteract);
            _reciContext.UserInteracts.Update(userInteract).Property(x => x.Id).IsModified = false;
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

        public Task<List<UserInteract>> GetBookmarkAsync(int userId)
        {
            var bookmarks = GetByCondition(x => x.UserId == userId && x.Bookmark == true).ToListAsync();
            return bookmarks;
        }

        public Task<List<UserInteract>> GetRatingAsync(int userId)
        {
            var ratings = GetByCondition(x => x.UserId == userId && x.Rating != null).ToListAsync();
            return ratings;
        }

        public async Task<List<TopBookmarkDTO>> GetTopBookmarkAsync(int topNumber)
        {
            var topBookmark = await GetAll().GroupBy(x => x.PostsId)
                                        .Select(x => new TopBookmarkDTO
                                        {
                                            PostId = x.Key,
                                            TotalBookmark = x.Count(),
                                        })
                                        .OrderByDescending(x => x.TotalBookmark)
                                        .Take(topNumber)
                                        .ToListAsync();
            return topBookmark;
        }
    }
}
