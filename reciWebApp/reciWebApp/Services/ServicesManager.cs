using AutoMapper;
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
        private IMapper _mapper;

        public ServicesManager(IRepositoryManager repoManager, IConfiguration config, IMapper mapper)
        {
            _repoManager = repoManager;
            _config = config;
            _mapper = mapper;
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
                    _postService = new PostService(_repoManager, _config, _mapper);
                }
                return _postService;
            }
        }
    }
}
