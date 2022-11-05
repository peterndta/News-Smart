using AutoMapper;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.DTOs.CategoryDTOs;
using reciWebApp.DTOs.CollectionDTOs;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.Services.Commons;
using reciWebApp.Services.Interfaces;
using reciWebApp.Services.Utils;

namespace reciWebApp.Services
{
    public class PostService : IPostService
    {
        private readonly IRepositoryManager _repoManager;
        private readonly IConfiguration _configuration;
        private readonly IMapper _mapper;
        public PostService(IRepositoryManager repoManager, IConfiguration config, IMapper mapper)
        {
            _repoManager = repoManager;
            _configuration = config;
            _mapper = mapper;
        }
        public bool CheckPostAuthority(int userId, string postId)
        {
            bool checkAuthority = true;
            if (!(_repoManager.User.GetUserById(userId)).Role.Equals(RoleTypes.Admin))
            {
                var post = _repoManager.Post.GetPostById(postId);
                if (userId != post.UserId)
                {
                    checkAuthority = false;
                }
            }
            return checkAuthority;
        }

        public async Task<ShowPostDTO> GetPostInfo(ShowPostDTO showPostDTO)
        {
            var listPostCategories = _repoManager.PostCategory.GetPostCategoriesByPostId(showPostDTO.Id).AsQueryable();
            //var categories = new List<Category>();
            //foreach (var postCategory in listPostCategories)
            //{
            //    var category = _repoManager.Category.GetCategoryById(postCategory.CategoryId);
            //    if (category != null)
            //    {
            //        categories.Add(category);
            //    }               
            //}
            var x = _repoManager.Category.GetAllCategories().AsQueryable();
            var categories = listPostCategories.Join(x,
                                                    pc => pc.CategoryId, c => c.Id,
                                                    (pc, c) => new { result = c }).Select(x => x.result).ToList();

            var listFoodCollection = _repoManager.FoodCollection.GetFoodCollectionsByPostId(showPostDTO.Id).AsQueryable();
            var collections = new List<Collection>();
            var y = (await _repoManager.Collection.GetCollectionsAsync()).AsQueryable();
            if (listFoodCollection == null)
            {
                showPostDTO.ListCollections = null;
            }
            else
            {
                //foreach (var foodCollection in listFoodCollection)
                //{
                //    var collection = _repoManager.Collection.GetCollection(foodCollection.CollectionId);
                //    if (collection != null)
                //    {
                //        collections.Add(collection);
                //    }
                //}
                collections = listFoodCollection.Join(y,
                                                        fc => fc.CollectionId, c => c.Id,
                                                        (fc, c) => new { result = c }).Select(x => x.result).ToList();
            }
            
            showPostDTO.ListCategories = _mapper.Map<List<ShowCategoryDTO>>(categories);
            showPostDTO.Continents = _repoManager.RecipeRegion.GetRecipeRegionsById(showPostDTO.RecipeRegionId).Continents;
            showPostDTO.Method = _repoManager.CookingMethod.GetCookingMethodById(showPostDTO.CookingMethodId).Method;
            showPostDTO.UserName = _repoManager.User.GetUserById(showPostDTO.UserId).Name;
            showPostDTO.AverageRating = _repoManager.UserInteract.GetAverageRating(showPostDTO.Id);
            showPostDTO.UsesOfFood = _repoManager.Use.GetUsesById(showPostDTO.UsesId).UsesOfFood;
            showPostDTO.ListCollections = _mapper.Map<List<ShowCollectionDTO>>(collections);
            return showPostDTO;
        }
    }
}