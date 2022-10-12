using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Hosting;
using Newtonsoft.Json.Linq;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.Data.Pagination;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.Services.Interfaces;
using reciWebApp.Services.Utils;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace reciWebApp.Controllers
{
    [Route("api/post")]
    [ApiController]
    public class PostsController : ControllerBase
    {
        private readonly IRepositoryManager _repoManager;
        private readonly IServicesManager _servicesManager;
        private readonly IMapper _mapper;

        public PostsController(IRepositoryManager repoManager, IMapper mapper, IServicesManager servicesManager)
        {
            _repoManager = repoManager;
            _mapper = mapper;
            _servicesManager = servicesManager;
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(string id)
        {
            try
            {
                var post = await _repoManager.Post.GetPostByIdAsync(id);

                if (post == null)
                {
                    return BadRequest(new Response(400, "Post id does not existed"));
                }

                var showPost = _mapper.Map<ShowPostDTO>(post);
                showPost = _servicesManager.PostService.GetPostInfo(showPost);
                return Ok(new Response(200, showPost));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }

        //View list my recipes
        [Route("~/api/user/{id}/post/page/{pageNumber}")]
        [HttpGet]
        public async Task<IActionResult> Get(int id, int pageNumber, [FromQuery] PostParams postParams)
        {
            try
            {
                var posts = await _repoManager.Post.GetAllPostsByUserIdAsync(postParams, id);

                if (!posts.Any())
                {
                    return BadRequest(new Response(400, "User do not have any post"));
                }

                postParams.PageNumber = pageNumber;
                var showPosts = _mapper.Map<List<ShowPostDTO>>(posts);
                for (int i = 0; i < showPosts.Count; i++)
                {
                    showPosts[i] = _servicesManager.PostService.GetPostInfo(showPosts[i]);
                }
                return Ok(new Response(200, showPosts, "", posts.Meta));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }

        //Create recipe
        [Route("~/api/user/{id}/post")]
        [HttpPost]
        public async Task<IActionResult> Post(int id, [FromBody] CreatePostDTO postDTO)
        {
            try
            {
                var user = await _repoManager.User.GetUserByIdAsync(id);

                if (user == null)
                {
                    return BadRequest(new Response(400, "User id does not existed"));
                }

                var createPost = _mapper.Map<Post>(postDTO);
                createPost.UserId = id;
                createPost.Id = DateTime.Now.ToString("yyyyMMddHHmmssffff");
                _repoManager.Post.CreatePost(createPost);
                await _repoManager.SaveChangesAsync();
                var createStep = _mapper.Map<Step>(postDTO);
                createStep.PostsId = createPost.Id;
                _repoManager.Step.CreateStep(createStep);
                await _repoManager.SaveChangesAsync();
                foreach (var categoryId in postDTO.CategoriesId)
                {
                    var postCategory = new PostCategory
                    {
                        PostId = createPost.Id,
                        CategoryId = categoryId
                    };
                    _repoManager.PostCategory.CreatePostCategory(postCategory);
                }
                await _repoManager.SaveChangesAsync();
                return Ok(new Response(200));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }

        //Update recipe
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(string id, [FromBody] UpdatePostDTO updatePostDTO)
        {
            try
            {
                var user = await _servicesManager.AuthService.GetUser(Request);

                if (user == null)
                {
                    return BadRequest(new Response(400, "Invalid user"));
                }

                var post = await _repoManager.Post.GetPostByIdAsync(id);
                if (post == null)
                {
                    return BadRequest(new Response(400, "Invalid post id"));
                }

                if (!_servicesManager.PostService.CheckPostAuthority(user.Id, id))
                {
                    return BadRequest(new Response(400, "You do not have permission"));
                }

                post = _mapper.Map<Post>(updatePostDTO);
                _repoManager.Post.UpdatePost(post);
                await _repoManager.SaveChangesAsync();
                return Ok(new Response(200, "Update successfully"));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }

        //Delete Recipe
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(string id)
        {
            try
            {
                var user = await _servicesManager.AuthService.GetUser(Request);

                if (user == null)
                {
                    return BadRequest(new Response(400, "Invalid user"));
                }

                var post = await _repoManager.Post.GetPostByIdAsync(id);
                if (post == null)
                {
                    return BadRequest(new Response(400, "Invalid post id"));
                }

                if (!_servicesManager.PostService.CheckPostAuthority(user.Id, id))
                {
                    return BadRequest(new Response(400, "You do not have permission"));
                }

                _repoManager.Post.DeletePost(post);
                await _repoManager.SaveChangesAsync();

                return Ok(new Response(200, "Delete successfully"));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }

        [HttpGet("page/{pageNumber}")]
        public async Task<IActionResult> Post(int pageNumber, [FromQuery] FilterAndSortPostDTO filterAndSort)
        {
            try
            {
                //var user = await _servicesManager.AuthService.GetUser(Request);

                //if (user == null)
                //{
                //    return BadRequest(new Response(400, "Invalid user"));
                //}
                List<Post>? getPostsByCategories = null;
                if (filterAndSort.Category != null)
                {
                    var categories = _repoManager.Category.GetCategoryByName(filterAndSort.Category);
                    var postCategories = _repoManager.PostCategory.GetPostCategoriesByCategory(categories);
                    getPostsByCategories = _repoManager.Post.GetPostsByPostCategories(postCategories);
                }

                List<Post>? getPostsByCookingMethods = null;
                if (filterAndSort.Method != null)
                {
                    var cookingMethods = _repoManager.CookingMethod.GetCookingMethodsByName(filterAndSort.Method);
                    getPostsByCookingMethods = _repoManager.Post.GetPostsByCookingMethods(cookingMethods);
                }

                List<Post>? getPostsByRecipeRegions = null;
                if (filterAndSort.Continent != null)
                {
                    var recipeRegions = _repoManager.RecipeRegion.GetRecipeRegionsByName(filterAndSort.Continent);
                    getPostsByRecipeRegions = _repoManager.Post.GetPostsByRecipeRegions(recipeRegions);
                }

                List<Post>? getPostsByUses = null;
                if (filterAndSort.Uses != null)
                {
                    var uses = _repoManager.Use.GetUsesByName(filterAndSort.Uses);
                    getPostsByUses = _repoManager.Post.GetPostsByUses(uses);
                }
                var postParams = new PostParams
                {
                    Name = filterAndSort.Search,
                    PostsByCookingMethods = getPostsByCookingMethods,
                    PostsRecipeRegions = getPostsByRecipeRegions,
                    PostsByCategories = getPostsByCategories,
                    PageNumber = filterAndSort.PageNumber,
                    PageSize = filterAndSort.PageSize,
                    Type = filterAndSort.Sort,
                    PostsByUses = getPostsByUses,
                };
                postParams.PageNumber = pageNumber;
                var posts = await _repoManager.Post.GetAllPostsAsync(postParams);
                var showPosts = _mapper.Map<List<ShowPostDTO>>(posts);
                for (int i = 0; i < showPosts.Count; i++)
                {
                    showPosts[i] = _servicesManager.PostService.GetPostInfo(showPosts[i]);
                }
                IEnumerable<ShowPostDTO> result = showPosts;
                if (postParams.Type != null)
                {
                    result = _servicesManager.PostService.SortPostByCondition(showPosts, postParams.Type);
                }
                return Ok(new Response(200, result, "", posts.Meta));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }
    }
}
