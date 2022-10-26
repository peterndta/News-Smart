using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Hosting;
using Newtonsoft.Json.Linq;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.Data.Pagination;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.DTOs.PostReportDTO;
using reciWebApp.DTOs.UserDTOs;
using reciWebApp.Services.Interfaces;
using reciWebApp.Services.Utils;
using System.Net.WebSockets;
using System.Security.Cryptography.X509Certificates;

namespace reciWebApp.Controllers
{
    [Route("api/post")]
    [ApiController]
    public class PostReportController : ControllerBase
    {
        private readonly IRepositoryManager _repoManager;
        private readonly IServicesManager _servicesManager;
        private readonly IMapper _mapper;

        public PostReportController(IRepositoryManager repoManager, IMapper mapper, IServicesManager servicesManager)
        {
            _repoManager = repoManager;
            _mapper = mapper;
            _servicesManager = servicesManager;
        }

        [Route("~/api/user/{id}/report")]
        [HttpPost]
        public async Task<IActionResult> CreateReport(int id, CreatePostReportDTO PostReportDTO)
        {
            try
            {
                //var currentUser = await _servicesManager.AuthService.GetUser(Request);

                //if (currentUser == null)
                //{
                //    return BadRequest(new Response(400, "Invalid user"));
                //}

                var post = _repoManager.Post.GetPostById(PostReportDTO.PostsId);
                if (post == null)
                {
                    return BadRequest(new Response(400, "Post id does not exist"));
                }
                var user = _repoManager.User.GetUserById(id);
                if (user == null)
                {
                    return BadRequest(new Response(400, "User id does not exist"));
                }
                if (PostReportDTO.Reason == null)
                {
                    return BadRequest(new Response(400, "You can not report without reasons"));
                }

                var createPostReportDTO = _mapper.Map<PostReport>(PostReportDTO);
                createPostReportDTO.Status = 0;
                createPostReportDTO.UserId = id;
                _repoManager.PostReport.CreatePostReport(createPostReportDTO);
                await _repoManager.SaveChangesAsync();

                var returnPostReport = _mapper.Map<ShowPostReportDTO>(createPostReportDTO);
                return Ok(new Response(200, returnPostReport, "Report sucessfully"));
            }
            catch (Exception e)
            {
                return BadRequest(new Response(400, e.Message));
            }
            
        }

        [Route("~/api/admin/report")]
        [HttpPut]
        public async Task<IActionResult> DenyReport(int reportId)
        {
            try
            {
                var postReport = _repoManager.PostReport.GetPostReportById(reportId);
                var currentUser = await _servicesManager.AuthService.GetUser(Request);

                if (currentUser == null)
                {
                    return BadRequest(new Response(400, "invalid user"));
                }

                if (postReport == null)
                {
                    return BadRequest(new Response(400, "Report id does not exist"));
                }

                var post = _repoManager.Post.GetPostById(postReport.PostsId);
                if (post == null)
                {
                    return BadRequest(new Response(400, "Post id does not exist"));
                }

                var user = _repoManager.User.GetUserById(postReport.UserId);
                if (user == null)
                {
                    return BadRequest(new Response(400, "User id does not exist"));
                }

                if (postReport.Status != 0)
                {
                    return BadRequest(new Response(400, "Report has already processed"));
                }
                
                var updateReport = _mapper.Map<PostReport>(postReport);
                _repoManager.PostReport.DenyReport(updateReport);
                await _repoManager.SaveChangesAsync();
                return Ok(new Response(200, "Deny report successfully"));
            }
            catch (Exception e)
            {
                return BadRequest(new Response(400, e.Message));
            }
        }

        [HttpGet]
        [Route("~/api/name/postReport/page/{pageNumber}")]
        public async Task<IActionResult> GetReportByPostName (int pageNumber, [FromQuery] PostFilterByNameParams nameParam)
        {
            try
            {
                List<PostReport> postReports = new List<PostReport>();
                List<User> userList = new List<User>();

                var postList = await _repoManager.Post.GetPostByNameAsync(nameParam);
                if (!postList.Any())
                {
                    return BadRequest(new Response(400, "Do not have any post!"));
                }    
                
                foreach (Post post in postList)
                {
                    var reportList = _repoManager.PostReport.GetPostReportByPostId(post.Id);   
                    var user = await _repoManager.User.GetUserByIdAsync(post.UserId);
                    postReports.AddRange(reportList);
                    userList.Add(user);
                }

                if(!postReports.Any())
                {
                    return BadRequest(new Response(400, "Do not have any report"));
                }  
                
                if(!userList.Any())
                {
                    return BadRequest(new Response(400, "Do not have any user"));
                }    

                var showReport = _mapper.Map<List<ReturnReportDTO>>(postReports);
                
                foreach (var report in showReport)
                {
                    report.UserName = _repoManager.User.GetUserById(report.UserId).Name;
                    report.PostName = _repoManager.Post.GetPostById(report.PostsId).Name;
                    report.PostDescription = _repoManager.Post.GetPostById(report.PostsId).Description;
                    report.Rating = _repoManager.UserInteract.GetAverageRating(report.PostsId);
                    report.PostUserName = _repoManager.User.GetUserById(_repoManager.Post.GetPostById(report.PostsId).UserId).Name;
                    report.ImageUrl = _repoManager.Post.GetPostById(report.PostsId).ImageUrl;
                }

                nameParam.PageNumber = pageNumber;
                var result = PaginatedList<ReturnReportDTO>.Create(showReport, nameParam.PageNumber, nameParam.PageSize);
                await _repoManager.SaveChangesAsync();
                return Ok(new Response(200, result, "", result.Meta));
            }
            catch (Exception e)
            {
                return BadRequest(new Response(400, e.Message));
            }
        }
    }
}
