using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.DTOs.FoodCollectionDTOs;
using reciWebApp.Services.Commons;
using reciWebApp.Services.Interfaces;
using reciWebApp.Services.Utils;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace reciWebApp.Controllers
{
    [Route("api/foodcollection")]
    [ApiController]
    [RoleAuthorization(RoleTypes.Admin)]
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
        // Create food collection
        [HttpPost]
        [Route("~/api/collection/{id}/foodcollection")]
        public async Task<IActionResult> Post(int id, [FromBody] CreateFoodCollecitionDTO foodCollecitionDTO)
        {
            try
            {
                var collection = await _repoManager.Collection.GetCollectionAsync(id);
                if (collection == null)
                {
                    return BadRequest(new Response(400, "Collection id is invalid"));
                }

                if (foodCollecitionDTO.PostsId == null)
                {
                    return BadRequest(new Response(400, "Post id is empty"));
                }
                
                var count = 0;
                var numberOfPostIncollection = (await _repoManager.FoodCollection.GetFoodCollectionsAsync(id)).Count;
                foreach (var postId in foodCollecitionDTO.PostsId)
                {
                    var post = await _repoManager.Post.GetActivePostByIdAsync(postId);
                    var foodCollection = await _repoManager.FoodCollection.GetFoodCollectionAsync(postId, id);
                    if (post != null && foodCollection == null)
                    {
                        count++;
                        _repoManager.FoodCollection.CreateFoodCollection(new FoodCollection
                        {
                            PostsId = postId,
                            CollectionId = id,
                        });
                    }
                    else if (post == null)
                    {
                        return BadRequest(new Response(400, "Post id is invalid"));
                    }
                }

                if (count == 0)
                {
                    return BadRequest(new Response(400, "No posts added"));
                }

                await _repoManager.SaveChangesAsync();
                return Ok(new Response(200, new
                                            {
                                                AlreadyExist = numberOfPostIncollection,
                                                Added = count,
                                            }, "Create food collection successfully"));                
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }

        [HttpPut]
        [Route("~/api/post/{id}/foodcollection")]
        public async Task<IActionResult> Put(string id, [FromBody] UpdateFoodCollectionDTO foodCollectionDTO)
        {
            try
            {
                var post = await _repoManager.Post.GetActivePostByIdAsync(id);
                if (post == null)
                {
                    return BadRequest(new Response(400, "Invalid post id"));
                }

                var getListCollection = _repoManager.FoodCollection.GetFoodCollectionsByPostId(id);
                if (getListCollection != null)
                {
                    _repoManager.FoodCollection.BulkDeleteFoodCollection(getListCollection);
                }

                if (foodCollectionDTO.CollectionsId == null)
                {
                    return BadRequest(new Response(400, "Collection id is empty"));
                }

                foreach (var collectionId  in foodCollectionDTO.CollectionsId)
                {
                    var collection = await _repoManager.Collection.GetCollectionAsync(collectionId);
                    if (collection != null)
                    {
                        _repoManager.FoodCollection.CreateFoodCollection(new FoodCollection
                        {
                            PostsId = id,
                            CollectionId = collectionId,
                        });
                    }
                    else
                    {
                        return BadRequest(new Response(400, "Invalid collection id"));
                    }
                }

                await _repoManager.SaveChangesAsync();
                return Ok(new Response(200, "", "Update successfully"));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }
    }
}
