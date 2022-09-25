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

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace reciWebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        public readonly ReciContext _reciContext;
        public readonly IAuthService _authService;
        public readonly IRepositoryManager _repoManager;
        public AuthenticationController(ReciContext reciContext, AuthService authService, RepositoryManager repoManager)
        {
            _reciContext = reciContext;
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

        [HttpGet]
        [Route("~/sigin-google")]
        public async Task<IActionResult> ExternalLoginCallBack()
        {
            var result = await HttpContext.AuthenticateAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            var userLogin = _authService.GetUser(result);
            if (userLogin == null)
            {
                return Redirect($"http://localhost:7297/error=invalid");
            }
            if (await _repoManager.User.GetUserAsync(userLogin.Email) == null)
            {
                _repoManager.User.CreateUser(userLogin);
            }
            else
            {
                var user = await _repoManager.User.GetUserAsync(userLogin.Email);
                if (user.BanTime != null)
                {
                    return Redirect($"http://localhost:7297/error=inactive-user");
                }
            }
            return Redirect($"http://localhost:7297/email={email}");
        }
    }   
}
