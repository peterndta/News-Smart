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

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace reciWebApp.Controllers
{
    [Produces("application/json")]
    [Route("api/authentication")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        public readonly IRepositoryManager _repoManager;
        public readonly IServicesManager _serviceManager;
        public AuthenticationController(IRepositoryManager repoManager, IServicesManager serviceManager)
        {
            _repoManager = repoManager;
            _serviceManager = serviceManager;   
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
                return Redirect($"http://recipe-sharing.vercel.app?error=invalid");
            }

            if (await _repoManager.User.GetUserByEmailAsync(userLogin.Email) == null)
            {
                userLogin.Role = "user";
                _repoManager.User.CreateUser(userLogin);
            }

            var user = await _repoManager.User.GetUserByEmailAsync(userLogin.Email);

            if (user.BanTime != null)
            {
                return Redirect($"http://recipe-sharing.vercel.app?error=inactive-user");
            }

            var accessToken = await _serviceManager.AuthService.GenerateToken(user);
            Response.Cookies.Append("jwt", accessToken, new CookieOptions
            {
                HttpOnly = true
            });
            return Redirect($"http://recipe-sharing.vercel.app/login?token={accessToken}");
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
    }   
}
