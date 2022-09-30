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

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace reciWebApp.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        public readonly IAuthService _authService;
        public readonly IRepositoryManager _repoManager;
        public AuthenticationController(IAuthService authService, IRepositoryManager repoManager)
        {
            _authService = authService;
            _repoManager = repoManager;
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
            var userLogin = _authService.GetUser(result);
            if (userLogin == null)
            {
                return Redirect($"http://localhost:7297?error=invalid");
            }

            if (await _repoManager.User.GetUserAsync(userLogin.Email) == null)
            {
                userLogin.Role = "user";
                _repoManager.User.CreateUser(userLogin);
            }

            var user = await _repoManager.User.GetUserAsync(userLogin.Email);

            if (user.BanTime != null)
            {
                return Redirect($"http://localhost:7297?error=inactive-user");
            }

            var accessToken = await _authService.GenerateToken(user);
            Response.Cookies.Append("jwt", accessToken, new CookieOptions
            {
                HttpOnly = true
            });
            return Redirect($"http://localhost:7297/login?token={accessToken}");
        }
    }   
}
