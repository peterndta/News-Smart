using Microsoft.AspNetCore.Authentication;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.Services.Interfaces;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace reciWebApp.Services
{
    public class AuthService : IAuthService
    {
        //private readonly IConfiguration _configuration;
        private readonly IRepositoryManager _repoManager;
        public readonly DateTime EXPIRED_AT = DateTime.UtcNow.AddMinutes(20);

        public AuthService(IRepositoryManager repoManager/*, IConfiguration config*/)
        {
            _repoManager = repoManager;
            //_configuration = config;
        }
        public JwtSecurityToken DecodeToken(string token)
        {
            var handler = new JwtSecurityTokenHandler();
            return handler.ReadJwtToken(token);
        }

        public async Task<string> GenerateToken(User user)
        {
            var signinCredentials = GetSigninCredentials();
            var claims = await GetClaims(user);
            var tokenOptions = GenerateTokenOptions(signinCredentials, claims);
            return new JwtSecurityTokenHandler().WriteToken(tokenOptions);
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
                    ImageUrl = imageUrl.Value,
                };
            }
            return null;
        }

        private SigningCredentials GetSigninCredentials()
        {
            var key = Encoding.UTF8.GetBytes("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");
            //var key = Encoding.UTF8.GetBytes(_configuration.GetValue<string>("SecretKey"));
            var secret = new SymmetricSecurityKey(key);

            return new SigningCredentials(secret, SecurityAlgorithms.HmacSha256);
        }

        private JwtSecurityToken GenerateTokenOptions(SigningCredentials signingCredentials, List<Claim> claims)
        {
            //var jwtSettings = _configuration.GetSection("JwtSettings");
            var tokenOptions = new JwtSecurityToken
            (
                "ReciApp",
                "http://localhost:7297",
                //jwtSettings.GetSection("ValidIssuer").Value,
                //jwtSettings.GetSection("ValidAudience").Value,
                claims,
                expires: DateTime.Now.AddMinutes(Convert.ToDouble(129600)),
                //expires: DateTime.Now.AddMinutes(Convert.ToDouble(jwtSettings.GetSection("expires").Value)),
                signingCredentials: signingCredentials
            );

            return tokenOptions;
        }

        private Task<List<Claim>> GetClaims(User user)
        {
            var claims = new List<Claim>
            {
                new("email", user.Email),
                new("name", user.Name),
                new("role", user.Role),
            };

            return Task.FromResult(claims);
        }
    }
}
