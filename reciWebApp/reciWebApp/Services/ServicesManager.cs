using reciWebApp.Data.IRepositories;
using reciWebApp.Services.Interfaces;

namespace reciWebApp.Services
{
    public class ServicesManager : IServicesManager
    {
        private IRepositoryManager _repoManager;
        private IConfiguration _config;
        private IAuthService _authService;
        private IPostService _postService;

        public ServicesManager(IRepositoryManager repoManager, IConfiguration config)
        {
            _repoManager = repoManager;
            _config = config;
        }

        public IAuthService AuthService
        {
            get
            {
                if (_authService == null)
                {
                    _authService = new AuthService(_repoManager, _config);
                }
                return _authService;
            }
        }

        public IPostService PostService
        {
            get
            {
                if (_postService == null)
                {
                    _postService = new PostService(_repoManager, _config);
                }
                return _postService;
            }
        }
    }
}
