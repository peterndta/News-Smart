using Microsoft.AspNetCore.Authentication;
using reciWebApp.Data.Models;
using reciWebApp.Services.Interfaces;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;

namespace reciWebApp.Services
{
    public class AuthService : IAuthService
    {
        public JwtSecurityToken DecodeToken(string token)
        {
            throw new NotImplementedException();
        }

        public Task<string> GenerateToken(User user)
        {
            throw new NotImplementedException();
        }

        public string GetEmail(HttpRequest request)
        {
            throw new NotImplementedException();
        }

        public User? GetUser(AuthenticateResult result)
        {
            var email = result.Principal.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Email);
            if (email != null)
            {
                var userName = result.Principal.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Name);
                var imageUrl = result.Principal.Claims.FirstOrDefault(x => x.Type == "picture");
                return new User
                {
                    Name = userName.Value,
                    Email = email.Value,                   
                };
            }
            return null;
        }
    }
}
