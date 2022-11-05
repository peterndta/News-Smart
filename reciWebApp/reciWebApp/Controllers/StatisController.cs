using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using reciWebApp.Data.IRepositories;
using reciWebApp.DTOs;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.Services.Interfaces;
using reciWebApp.Services.Utils;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace reciWebApp.Controllers
{
    [Route("api/statis")]
    [ApiController]
    public class StatisController : ControllerBase
    {
        private readonly IRepositoryManager _repoManager;
        private readonly IServicesManager _serviceManager;
        private readonly IMapper _mapper;
        public StatisController(IRepositoryManager repoManager, IServicesManager serviceManager, IMapper mapper)
        {
            _repoManager = repoManager;
            _serviceManager = serviceManager;
            _mapper = mapper;
        }
        //Get statis
        //[HttpGet]
        //public async Task<IActionResult> Get()
        //{
        //    try
        //    {
        //        var totalPosts = await _repoManager.Post.TotalPostsAsync();
        //        var totalAccounts = await _repoManager.User.TotalAccountsAsync();
        //        var topBookmarks = await _repoManager.UserInteract.GetTopBookmarkAsync(5);
        //        var listTopPost = new List<ShowTopPostsByBookmark>();
        //        foreach (var bookmark in topBookmarks)
        //        {
        //            var post = await _repoManager.Post.GetPostByIdAsync(bookmark.PostId);
        //            if (post != null)
        //            {
        //                listTopPost.Add(new ShowTopPostsByBookmark
        //                {
        //                    Name = post.Name,
        //                    TotalBookmark = bookmark.TotalBookmark,
        //            });
        //            }                   
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return BadRequest(new Response(500, ex.Message));
        //    }
        //}
    }
}
