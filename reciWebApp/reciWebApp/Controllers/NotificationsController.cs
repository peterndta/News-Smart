using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.DTOs.NotificationDTOs;
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
        [Route("~/api/user/{id}/notifications")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                var currentUser = _repoManager.User.GetUserById(id);
                if (currentUser == null)
                {
                    return BadRequest(new Response(500, "Invalid user"));
                }

                var listPosts = await _repoManager.Post.GetBannedPostByUserIdAsync(currentUser.Id);
                var listNotification = new List<Notification>();

                if (listPosts.Count != 0)
                {
                    foreach (var postId in listPosts.Select(x => x.Id))
                    {
                        var report = await _repoManager.PostReport.GetApprovedReportByPostIdAsync(postId);
                        var notification = await _repoManager.Notification.GetNotificationByReportId(report.Id);
                        listNotification.Add(notification);
                    }
                }

                var showNotification = _mapper.Map<List<ShowNotificationDTO>>(listNotification);
                return BadRequest(new Response(200, showNotification));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }

        [HttpGet]
        [Route("~/api/user/{id}/new-notifications")]
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
                return BadRequest(new Response(200, new
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
                var newNotification = 0;

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
                return BadRequest(new Response(200, "Mark read successfully"));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }
    }
}
