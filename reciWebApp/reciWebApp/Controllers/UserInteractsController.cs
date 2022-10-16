using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.DTOs;
using reciWebApp.DTOs.UserInteractDTOs;
using reciWebApp.Services.Interfaces;
using reciWebApp.Services.Utils;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace reciWebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserInteractsController : ControllerBase
    {
        private readonly IRepositoryManager _repoManager;
        private readonly IServicesManager _servicesManager;
        private readonly IMapper _mapper;

        public UserInteractsController(IRepositoryManager repoManager, IMapper mapper, IServicesManager servicesManager)
        {
            _repoManager = repoManager;
            _mapper = mapper;
            _servicesManager = servicesManager;
        }
        // GET: api/<IUserInteractsController>
        [HttpPost]
        [Route("~/api/post/{id}/rating")]
        public async Task<IActionResult> Post(string id, [FromBody] RatingDTO ratingDTO)
        {
            try
            {
                var currentUser = await _servicesManager.AuthService.GetUser(Request);

                if (currentUser == null)
                {
                    return BadRequest(new Response(400, "Invalid user"));
                }

                if (await _repoManager.Post.GetPostByIdAsync(id) == null)
                {
                    return BadRequest(new Response(400, "Invalid post id"));
                }

                var userInteract = await _repoManager.UserInteract.GetUserInteractAsync(currentUser.Id, id);
                if (userInteract == null)
                {
                    _repoManager.UserInteract.CreateUserInteract(new UserInteract
                    {
                        UserId = currentUser.Id,
                        PostsId = id,
                        Rating = ratingDTO.Rating,
                    });
                }
                else if (userInteract.Rating != null)
                {
                    return BadRequest(new Response(400, "Already rating"));
                }
                else
                {
                    userInteract.Rating = ratingDTO.Rating;
                    _repoManager.UserInteract.UpdateUserInteract(userInteract);
                }
                await _repoManager.SaveChangesAsync();
                return Ok(new Response(200, new
                {
                    PostId = id,
                    AverageRating = _repoManager.UserInteract.GetAverageRating(id),
                }));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }

        [HttpPost]
        [Route("~/api/post/{id}/bookmark")]
        public async Task<IActionResult> Post(string id, [FromBody] BookmarkDTO bookmarkDTO)
        {
            try
            {
                var currentUser = await _servicesManager.AuthService.GetUser(Request);

                if (currentUser == null)
                {
                    return BadRequest(new Response(400, "Invalid user"));
                }

                if (await _repoManager.Post.GetPostByIdAsync(id) == null)
                {
                    return BadRequest(new Response(400, "Invalid post id"));
                }

                var userInteract = await _repoManager.UserInteract.GetUserInteractAsync(currentUser.Id, id);
                if (userInteract == null)
                {
                    _repoManager.UserInteract.CreateUserInteract(new UserInteract
                    {
                        UserId = currentUser.Id,
                        PostsId = id,
                        Bookmark = bookmarkDTO.Bookmark,
                    });
                }
                else
                {
                    if (bookmarkDTO.Bookmark == false && userInteract.Rating == null)
                    {
                        _repoManager.UserInteract.DeleteUserInteract(userInteract);
                    }
                    else
                    {
                        userInteract.Bookmark = bookmarkDTO.Bookmark;
                        _repoManager.UserInteract.UpdateUserInteract(userInteract);
                    }
                }
                await _repoManager.SaveChangesAsync();
                return Ok(new Response(200, "", "Add bookmark successflly"));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }
    }
}
