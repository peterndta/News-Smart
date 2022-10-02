using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.DTOs;
using reciWebApp.Services.Utils;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace reciWebApp.Controllers
{
    [Route("api/post")]
    [ApiController]
    public class PostsController : ControllerBase
    {
        private readonly IRepositoryManager _repoManager;
        private readonly IMapper _mapper;

        public PostsController(IRepositoryManager repoManager, IMapper mapper)
        {
            _repoManager = repoManager;
            _mapper = mapper;
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(string id)
        {
            try
            {
                var post = await _repoManager.Post.GetPostById(id);

                if (post == null)
                {
                    return BadRequest(new Response("Post id does not existed"));
                }

                return Ok(new Response(post));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(ex.Message));
            }
        }

        [Route("~/api/user/{id}/post")]
        [HttpGet]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                var posts = await _repoManager.Post.GetPostByUserId(id);
                
                if (!posts.Any())
                {
                    return BadRequest(new Response("User do not have any post"));
                }

                return Ok(new Response(posts));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(ex.Message));
            }
        }

        [Route("~/api/user/{id}/post")]
        [HttpPost]
        public async Task<IActionResult> Post(int id, [FromBody] CreatePostDTO postDTO)
        {
            try
            {
                var user = await _repoManager.User.GetUserByIdAsync(id);

                if (user == null)
                {
                    return BadRequest(new Response("User id does not existed"));
                }

                var post = _mapper.Map<Post>(postDTO);
                post.UserId = id;
                _repoManager.Post.CreatePost(post);
                _repoManager.SaveChangesAsyns();
                return Ok(new Response(post));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(ex.Message));
            }
        }

        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
