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
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                var totalPosts = await _repoManager.Post.TotalPostsAsync();
                var totalAccounts = await _repoManager.User.TotalAccountsAsync();
                var topBookmarks = await _repoManager.UserInteract.GetTopBookmarkAsync();
                var totalBookmark = await _repoManager.UserInteract.TotalBookmarkAsync();
                var listTopPost = new List<ShowTopPostsByBookmark>();
                foreach (var bookmark in topBookmarks)
                {
                    var post = await _repoManager.Post.GetActivePostByIdAsync(bookmark.PostId);
                    if (post != null)
                    {
                        listTopPost.Add(new ShowTopPostsByBookmark
                        {
                            Name = post.Name,
                            TotalBookmark = bookmark.TotalBookmark,
                        });
                    }
                }

                var posts = _repoManager.Post.GetAllActivePost();
                var userInteracts = _repoManager.UserInteract.GetAllUserInteracts();
                var topPosts = _repoManager.Post.GetTopUserHaveMostPost(5);

                var topUserHighRating = _repoManager.User.GetTopUserHighRatings(5, userInteracts, posts).ToList();
                var topUserHaveMostPosts = _repoManager.User.GetTopUserMostPost(topPosts).ToList();
                var topPostsHighRating = _repoManager.Post.GetPostsHighRating(7, userInteracts).ToList();

                var tolalReport = await _repoManager.PostReport.TotalReportAsync();

                var result = new StatisDTO
                {
                    TotalPosts = totalPosts,
                    TotalAccounts = totalAccounts,
                    TopPostByBookmark = listTopPost.Take(5).ToList(),
                    TopUserByHighRating = topUserHighRating,
                    TopUserByHighPost = topUserHaveMostPosts,
                    TotalReport = tolalReport,
                    TotalBookmark = totalBookmark,
                    PostsWithHighRating = topPostsHighRating,
                };

                return Ok(new Response(200, result));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }
    }
}
