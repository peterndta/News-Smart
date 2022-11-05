using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.Data.Pagination;
using reciWebApp.DTOs.NotificationDTOs;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.Services.Commons;
using reciWebApp.Services.Interfaces;
using reciWebApp.Services.Utils;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace reciWebApp.Controllers
{
    [Route("api/notifications")]
    [ApiController]
    public class NotificationsController : ControllerBase
    {
        private readonly IRepositoryManager _repoManager;
        private readonly IMapper _mapper;
        private readonly IServicesManager _servicesManager;

        public NotificationsController(IRepositoryManager repoManager, IMapper mapper, IServicesManager servicesManager)
        {
            _repoManager = repoManager;
            _mapper = mapper;
            _servicesManager = servicesManager;
        }

        [HttpGet]
        [Route("~/api/user/{id}/notifications/page/{pageNumber}")]
        [RoleAuthorization(RoleTypes.User)]
        public async Task<IActionResult> Get(int id, int pageNumber, [FromQuery] NotificationParams @params)
        {
            try
            {
                var currentUser = _repoManager.User.GetUserById(id);
                if (currentUser == null)
                {
                    return BadRequest(new Response(500, "Invalid user"));
                }

                var listPosts = await _repoManager.Post.GetBannedPostByUserIdAsync(currentUser.Id);
                var showNotification = new List<ShowNotificationDTO>();

                if (listPosts.Count != 0)
                {
                    foreach (var postId in listPosts.Select(x => x.Id))
                    {
                        var report = await _repoManager.PostReport.GetApprovedReportByPostIdAsync(postId);
                        var notification = await _repoManager.Notification.GetNotificationByReportId(report.Id);
                        var showNoti = _mapper.Map<ShowNotificationDTO>(notification);
                        var post = await _repoManager.Post.GetBannedPostByIdAsync(postId);
                        showNoti.Name = post.Name;
                        showNoti.ImageUrl = post.ImageUrl;
                        showNotification.Add(showNoti);
                    }
                }

                showNotification = showNotification.OrderByDescending(x => x.CreateDate).ToList();

                var result = PaginatedList<ShowNotificationDTO>.Create(showNotification, pageNumber, @params.PageSize);
                return Ok(new Response(200, result, "", result.Meta));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }

        [HttpGet]
        [Route("~/api/user/{id}/new-notifications")]
        [RoleAuthorization(RoleTypes.User)]
        public async Task<IActionResult> GetNewNotification(int id)
        {
            try
            {
                var currentUser = _repoManager.User.GetUserById(id);
                if (currentUser == null)
                {
                    return BadRequest(new Response(500, "Invalid user"));
                }

                var listPosts = await _repoManager.Post.GetBannedPostByUserIdAsync(currentUser.Id);
                var newNotification = 0;

                if (listPosts.Count != 0)
                {
                    foreach (var postId in listPosts.Select(x => x.Id))
                    {
                        var report = await _repoManager.PostReport.GetApprovedReportByPostIdAsync(postId);
                        var notification = await _repoManager.Notification.GetNewNotificationByReportId(report.Id);
                        if (notification != null)
                        {
                            newNotification++;
                        }
                    }
                }
                return Ok(new Response(200, new
                                                    {
                                                        NewNotification = newNotification,
                                                    }));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }

        // PUT api/<NotificationsController>/5
        [HttpPut()]
        [Route("~/api/user/{id}/mark-read")]
        [RoleAuthorization(RoleTypes.User)]
        public async Task<IActionResult> Put(int id)
        {
            try
            {
                var currentUser = _repoManager.User.GetUserById(id);
                if (currentUser == null)
                {
                    return BadRequest(new Response(500, "Invalid user"));
                }

                var listPosts = await _repoManager.Post.GetBannedPostByUserIdAsync(currentUser.Id);

                if (listPosts.Count != 0)
                {
                    foreach (var postId in listPosts.Select(x => x.Id))
                    {
                        var report = await _repoManager.PostReport.GetApprovedReportByPostIdAsync(postId);
                        var notification = await _repoManager.Notification.GetNotificationByReportId(report.Id);
                        if (notification.HaveSeen == false)
                        {
                            notification.HaveSeen = true;
                            _repoManager.Notification.UpdateNotification(notification);
                        }
                    }
                    await _repoManager.SaveChangesAsync();
                }
                return Ok(new Response(200, "Mark read successfully"));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }
    }
}
