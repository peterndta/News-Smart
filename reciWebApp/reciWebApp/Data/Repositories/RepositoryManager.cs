using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;

namespace reciWebApp.Data.Repositories
{
    public class RepositoryManager : IRepositoryManager
    {
        private readonly ReciContext _context;
        private IUserRepository _userRepository;
        public RepositoryManager(ReciContext context)
        {
            _context = context;
        }
        public IUserRepository User
        {
            get
            {
                if (_userRepository == null)
                {
                    _userRepository = new UserRepository(_context);
                }
                return _userRepository;
            }
        }
    }
}
