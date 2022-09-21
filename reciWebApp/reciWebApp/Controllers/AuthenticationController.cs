using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using reciWebApp.Data.Models;
using Microsoft.Net.Http.Headers;
using System.Security.Claims;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace reciWebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        public readonly ReciContext _reciContext;
        public AuthenticationController(ReciContext reciContext)
        {
            _reciContext = reciContext;
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
            string email = result.Principal.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Email).Value;
            return Redirect($"https://localhost:7297/email={email}");
        }
    }   
}
