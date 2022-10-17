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
        private IPostCategoryRepository _postCategoryRepository;
        private IUsesRepository _usesRepository;
        private IUserInteractRepository _userInteractRepository;
        private ICollectionRepository _collectionRepository;
        private IFoodCollectionRepository _foodCollectionRepository;
        private IPostReportRepository _postReportRepository;
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

        public IPostCategoryRepository PostCategory
        {
            get
            {
                if (_postCategoryRepository == null)
                {
                    _postCategoryRepository = new PostCategoryRepository(_context);
                }
                return _postCategoryRepository;
            }
        }

        public IUsesRepository Use
        {
            get
            {
                if (_usesRepository == null)
                {
                    _usesRepository = new UsesRepository(_context);
                }
                return _usesRepository;
            }
        }

        public IUserInteractRepository UserInteract
        {
            get
            {
                if (_userInteractRepository == null)
                {
                    _userInteractRepository = new UserInteractRepository(_context);
                }
                return _userInteractRepository;
            }
        }

        public ICollectionRepository Collection
        {
            get
            {
                if (_collectionRepository == null)
                {
                    _collectionRepository = new CollectionReposiroty(_context);
                }
                return _collectionRepository;
            }
        }

        public IFoodCollectionRepository FoodCollection
        {
            get
            {
                if (_foodCollectionRepository == null)
                {
                    _foodCollectionRepository = new FoodCollectionRepository(_context);
                }
                return _foodCollectionRepository;
            }
        }

        public IPostReportRepository PostReport
        {
            get
            {
                if (_postReportRepository == null)
                {
                    _postReportRepository = new PostReportRepository(_context);
                }
                return _postReportRepository;
            }
        }

        public Task SaveChangesAsync()
        {
            return _context.SaveChangesAsync();
        }
    }
}
