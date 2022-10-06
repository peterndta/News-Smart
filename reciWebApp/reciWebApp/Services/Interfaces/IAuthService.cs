using Microsoft.AspNetCore.Authentication;
using reciWebApp.Data.Models;
using System.IdentityModel.Tokens.Jwt;

namespace reciWebApp.Services.Interfaces
{
    public interface IAuthService
    {
        public Task<string> GenerateToken(User user);
        public JwtSecurityToken DecodeToken(string token);
        public User? GetUser(AuthenticateResult result);
        public Task<User?> GetUser(HttpRequest request);
    }
}
