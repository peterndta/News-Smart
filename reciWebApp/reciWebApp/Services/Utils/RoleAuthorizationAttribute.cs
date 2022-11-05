using Google.Apis.Discovery;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Net.Http.Headers;
using reciWebApp.Data.IRepositories;
using reciWebApp.Services.Interfaces;
using System.Data;
using System.Reflection.Metadata;

namespace reciWebApp.Services.Utils
{
    public class RoleAuthorizationAttribute : Attribute, IAuthorizationFilter
    {
        private IServicesManager? _servicesManager;
        public string[] _roles;

        public RoleAuthorizationAttribute(params string[] roles)
        {
            _roles = roles;
        }

        public void OnAuthorization(AuthorizationFilterContext context)
        {
            _servicesManager = context.HttpContext.RequestServices.GetService<IServicesManager>();

            if (context.HttpContext.Request.Headers.TryGetValue(HeaderNames.Authorization, out var headers))
            {
                bool valid = false;
                var token = headers.First();
                var role = _servicesManager?.AuthService.DecodeToken(token).Claims.FirstOrDefault(x => x.Type == "role")?.Value;

                foreach (var acceptRole in _roles)
                {
                    if (role.Equals(acceptRole))
                    {
                        valid = true;
                    }
                }

                if (!valid)
                {
                    context.Result = new JsonResult(new Response(403, $"{role} is not allowed to operate this process"));
                }
            }
            else
            {
                context.Result = new JsonResult(new Response(401, "Not authorized"));
            }
        }
    }
}
