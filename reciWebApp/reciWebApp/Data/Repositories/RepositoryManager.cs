using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;

namespace reciWebApp.Data.Repositories
{
    public class RepositoryManager : IRepositoryManager
    {
        private readonly ReciContext _context;
        private IUserRepository _userRepository;
        private IPostRepository _postRepository;
        private IStepRepository _stepRepository;
        private ICategoryRepository _categoryRepository;
        private ICookingMethodRepository _cookingMethodRepository; 
        private IRecipeRegionRepository _recipeRegionRepository;
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

        public IPostRepository Post
        {
            get
            {
                if (_postRepository == null)
                {
                    _postRepository = new PostRepository(_context);
                }
                return _postRepository;
            }
        }

        public IStepRepository Step
        {
            get
            {
                if (_stepRepository == null)
                {
                    _stepRepository = new StepRepository(_context);
                }
                return _stepRepository;
            }
        }

        public ICategoryRepository Category
        {
            get
            {
                if (_categoryRepository == null)
                {
                    _categoryRepository = new CategoryRepository(_context);
                }
                return _categoryRepository;
            }
        }

        public ICookingMethodRepository CookingMethod
        {
            get
            {
                if (_cookingMethodRepository == null)
                {
                    _cookingMethodRepository = new CookingMethodRepository(_context);
                }
                return _cookingMethodRepository;
            }
        }

        public IRecipeRegionRepository RecipeRegion
        {
            get
            {
                if (_recipeRegionRepository == null)
                {
                    _recipeRegionRepository = new RecipeRegionRepository(_context);
                }
                return _recipeRegionRepository;
            }
        }

        public Task SaveChangesAsync()
        {
            return _context.SaveChangesAsync();
        }
    }
}
