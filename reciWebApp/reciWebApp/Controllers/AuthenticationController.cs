using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using reciWebApp.Data.Models;
using Microsoft.Net.Http.Headers;
using System.Security.Claims;
using reciWebApp.Services.Interfaces;
using reciWebApp.Services;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Repositories;
using Microsoft.AspNetCore.Http;
using reciWebApp.Services.Utils;
using reciWebApp.DTOs;
using AutoMapper;
using reciWebApp.Services.Commons;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace reciWebApp.Controllers
{
    [Produces("application/json")]
    [Route("api/authentication")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        private readonly IRepositoryManager _repoManager;
        private readonly IServicesManager _serviceManager;
        private readonly IMapper _mapper;
        public AuthenticationController(IRepositoryManager repoManager, IServicesManager serviceManager, IMapper mapper)
        {
            _repoManager = repoManager;
            _serviceManager = serviceManager; 
            _mapper = mapper;
        }

        [HttpGet("")]
        public IActionResult ExternalLogin()
        {
            var props = new AuthenticationProperties();
            var callback = Url.Action("ExternalLoginCallBack");
            props.RedirectUri = callback;
            return Challenge(props, "Google");
        }
       
        [HttpGet("signin-google")]
        public async Task<IActionResult> ExternalLoginCallBack()
        {
            var result = await HttpContext.AuthenticateAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            var userLogin = _serviceManager.AuthService.GetUser(result);
            if (userLogin == null)
            {
                return Redirect($"https://recipe-sharing.vercel.app/login?error=invalid");
            }

            if (await _repoManager.User.GetUserByEmailAsync(userLogin.Email) == null)
            {
                userLogin.Role = RoleTypes.User;
                _repoManager.User.CreateUser(userLogin);
                await _repoManager.SaveChangesAsync();
            }

            var user = await _repoManager.User.GetUserByEmailAsync(userLogin.Email);

            if (user.BanTime != null)
            {
                return Redirect($"https://recipe-sharing.vercel.app/login?error=inactive-user");
            }

            var accessToken = await _serviceManager.AuthService.GenerateToken(user);
            Response.Cookies.Append("jwt", accessToken, new CookieOptions
            {
                HttpOnly = true
            });
            return Redirect($"https://recipe-sharing.vercel.app/login?token={accessToken}");
        }

        [HttpPost]
        [Route("auth")]
        public async Task<IActionResult> IsAuthenticated()
        {
            try
            {
                if (Request.Headers.TryGetValue(HeaderNames.Authorization, out var headers))
                {
                    var token = headers.First();
                    var jwtToken = _serviceManager.AuthService.DecodeToken(token);

                    var emailClaim = jwtToken.Claims.FirstOrDefault(x => x.Type == "email").Value;
                    var roleClaim = jwtToken.Claims.FirstOrDefault(x => x.Type == "role").Value;

                    var userBasedEmail = await _repoManager.User.GetUserByEmailAsync(emailClaim);

                    if (userBasedEmail != null)
                    {
                        if (!userBasedEmail.Role.Equals(roleClaim))
                            return Unauthorized(new Response(401, "You don't have permission for this request"));
                    }
                    else
                    {
                        return BadRequest(new Response(400, "Invalid token"));
                    }

                    return Ok(new Response(200,"","Authorized"));
                }
                return BadRequest(new Response(400, "Fail"));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }

        [HttpPost("mobile")]
        public async Task<IActionResult> Post([FromBody] AuthMobileDTO authMobile)
        {
            try
            {
                if (await _repoManager.User.GetUserByEmailAsync(authMobile.Email) == null)
                {
                    User userAuth = _mapper.Map<User>(authMobile);
                    userAuth.Role = RoleTypes.User;
                    _repoManager.User.CreateUser(userAuth);
                    await _repoManager.SaveChangesAsync();
                }

                var user = await _repoManager.User.GetUserByEmailAsync(authMobile.Email);
                if (user.BanTime != null)
                {
                    return BadRequest(new Response(400, "Inactive user"));
                }

                var accessToken = await _serviceManager.AuthService.GenerateToken(user);
                return Ok(new Response(200, accessToken, ""));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }
    }   
}
