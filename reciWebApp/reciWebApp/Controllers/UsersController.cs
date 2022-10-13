﻿using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.DTOs.UserDTOs;
using reciWebApp.Services.Interfaces;
using reciWebApp.Services.Utils;

namespace reciWebApp.Controllers
{
    [Route("api/user")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IRepositoryManager _repoManager;
        private readonly IServicesManager _servicesManager;
        private readonly IMapper _mapper;

        public UsersController(IRepositoryManager repoManager, IMapper mapper, IServicesManager servicesManager)
        {
            _repoManager = repoManager;
            _mapper = mapper;
            _servicesManager = servicesManager;
        }

        [HttpGet]
        [Route("~/api/user")]
        public async Task<IActionResult> GetAllUser(int id)
        {
            try
            {
                var currentUser = await _servicesManager.AuthService.GetUser(Request);

                if (currentUser == null)
                {
                    return BadRequest(new Response(400, "Invalid user"));
                }

                var user = await _repoManager.User.GetUserByIdAsync(id);
                if (user == null)
                {
                    return BadRequest(new Response(400, "User id does not existed"));
                }

                if (!user.Role.Equals("admin"))
                {
                    return BadRequest(new Response(400, "You do not have permission"));
                }

                List<User> userList = await _repoManager.User.GetAllUserAsync();
                if (!userList.Any())
                {
                    return BadRequest(new Response(400, "There is no user in database"));
                }

                var showUserList = _mapper.Map<List<User>>(userList);

                return Ok(new Response(200, showUserList));
            }
            catch (Exception e)
            {
                return BadRequest(new Response(400, e.Message));
            }

        }

        [HttpGet]
        [Route("~/api/user/{id}/allactivity")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                var currentUser = await _servicesManager.AuthService.GetUser(Request);

                if (currentUser == null)
                {
                    return BadRequest(new Response(400, "Invalid user"));
                }

                var user = await _repoManager.User.GetUserByIdAsync(id);
                if (user == null)
                {
                    return BadRequest(new Response(400, "User id does not existed"));
                }

                var bookmarks = await _repoManager.UserInteract.GetBookmarkAsync(id);
                var ratings = await _repoManager.UserInteract.GetRatingAsync(id);
                var posts = await _repoManager.Post.GetPostByUserIdAsync(id);
                var activity = new ActivityDTO
                {
                    TotalPosts = posts.Count,
                    TotalBookmarks = bookmarks.Count,
                    TotalRatings = ratings.Count,
                };
                return Ok(new Response(200, activity));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }
    }
}