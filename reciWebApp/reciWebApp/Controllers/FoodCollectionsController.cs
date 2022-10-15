using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.DTOs.FoodCollectionDTOs;
using reciWebApp.Services.Interfaces;
using reciWebApp.Services.Utils;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace reciWebApp.Controllers
{
    [Route("api/foodcollection")]
    [ApiController]
    public class FoodCollectionsController : ControllerBase
    {
        private readonly IRepositoryManager _repoManager;
        private readonly IServicesManager _servicesManager;
        private readonly IMapper _mapper;
        public FoodCollectionsController(IRepositoryManager repoManager, IServicesManager servicesManager, IMapper mapper)
        {
            _repoManager = repoManager;
            _servicesManager = servicesManager;
            _mapper = mapper;
        }
        // POST api/<FoodCollectionsController>
        [HttpPost]
        [Route("~/api/collection/{id}/foodcollection")]
        public async Task<IActionResult> Post(int id, [FromBody] CreateFoodCollecitionDTO foodCollecitionDTO)
        {
            try
            {
                //var currentUser = await _servicesManager.AuthService.GetUser(Request);

                //if (currentUser == null)
                //{
                //    return BadRequest(new Response(400, "Invalid user"));
                //}

                //if (!currentUser.Role.Equals("admin"))
                //{
                //    return BadRequest(new Response(400, "You do not have permission"));
                //}

                var collection = await _repoManager.Collection.GetCollectionAsync(id);
                if (collection == null)
                {
                    return BadRequest(new Response(400, "Collection id is invalid"));
                }

                if (foodCollecitionDTO.PostsId != null)
                {
                    foreach (var postId in foodCollecitionDTO.PostsId)
                    {
                        var post = await _repoManager.Post.GetPostByIdAsync(postId);
                        if (post != null)
                        {
                            _repoManager.FoodCollection.CreateFoodCollection(new FoodCollection
                            {
                                Id = id,
                                PostsId = postId,
                            });
                        }
                    }
                    await _repoManager.SaveChangesAsync();
                    return Ok(new Response(200, "", "Create food collection successfully"));
                }
                return BadRequest(new Response(400, "Post id is empty"));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }
    }
}
