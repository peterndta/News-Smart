﻿using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Hosting;
using Newtonsoft.Json.Linq;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.Data.Pagination;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.DTOs.PostReportDTO;
using reciWebApp.Services.Interfaces;
using reciWebApp.Services.Utils;

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
            var currentUser = await _servicesManager.AuthService.GetUser(Request);

            if (currentUser == null)
            {
                return BadRequest(new Response(400, "Invalid user"));
            }

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

            var createPostReportDTO = _mapper.Map<PostReport>(PostReportDTO);
            createPostReportDTO.Status = 0;
            createPostReportDTO.UserId = id;
            _repoManager.PostReport.CreatePostReport(createPostReportDTO);
            await _repoManager.SaveChangesAsync();

            var returnPostReport = _mapper.Map<ShowPostReportDTO>(createPostReportDTO);
            return Ok(new Response(200, returnPostReport, "Report sucessfully"));
        }
    }
}
