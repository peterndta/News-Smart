using reciWebApp.Data.IRepositories;
using reciWebApp.Services.Interfaces;

namespace reciWebApp.Services
{
    public class PostService : IPostService
    {
        private readonly IRepositoryManager _repoManager;
        private readonly IConfiguration _configuration;
        public PostService(IRepositoryManager repoManager, IConfiguration config)
        {
            _repoManager = repoManager;
            _configuration = config;
        }
        public bool CheckPostAuthority(int userId, string postId)
        {
            bool checkAuthority = true;
            if (!(_repoManager.User.GetUserById(userId)).Role.Equals("admin"))
            {
                var post = _repoManager.Post.GetPostById(postId);
                if (userId != post.UserId)
                {
                    checkAuthority = false;
                }
            }
            return checkAuthority;
        }
    }
}
