using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using reciWebApp.Configs;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.Data.Repositories;
using reciWebApp.Services;
using reciWebApp.Services.Interfaces;
using System.Security.Claims;
using System.Text;
using SameSiteMode = Microsoft.AspNetCore.Http.SameSiteMode;

var builder = WebApplication.CreateBuilder(args);
//var jwtSettings = builder.Configuration.GetSection("JwtSettings");

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddDbContext<ReciContext>(options =>
{
    options.UseSqlServer("Server=reci.cnikyqokwrnq.ap-southeast-1.rds.amazonaws.com;Database=Reci;uid=admin;pwd=Swd3922022;Trusted_Connection=False;");
    //options.UseSqlServer(builder.Configuration.GetConnectionString("AppConnection"));
});
builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
})
    .AddJwtBearer(options =>
    {
        options.RequireHttpsMetadata = true;
        options.SaveToken = true;
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuerSigningKey = true,
            IssuerSigningKey =
                new SymmetricSecurityKey(Encoding.UTF8.GetBytes("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")),
                //new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration.GetValue<string>("SecretKey"))),
            ValidateLifetime = true,
            ValidateAudience = true,
            ValidateIssuer = true,
            ClockSkew = TimeSpan.Zero,
            ValidIssuer = "ReciApp",
            ValidAudience = "https://reciapp.azurewebsites.net",
            //ValidIssuer = jwtSettings.GetSection("ValidIssuer").Value,
            //ValidAudience = jwtSettings.GetSection("ValidAudience").Value
        };
    })
    .AddGoogle(options =>
    {
        //IConfigurationSection googleAuthNSection = builder.Configuration.GetSection("Authentication:Google");
        options.ClientId = "877217021377-qnrb7lma4t1u5od0svhb5q3jc9aepqel.apps.googleusercontent.com";
        options.ClientSecret = "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";
        //options.ClientId = googleAuthNSection["ClientId"];
        //options.ClientSecret = googleAuthNSection["ClientSecret"];
        options.SignInScheme = CookieAuthenticationDefaults.AuthenticationScheme;
        options.SaveTokens = true;
        options.ReturnUrlParameter = "~/";
        options.Scope.Add("profile");
        options.Events.OnCreatingTicket = context =>
        {
            var picture = context.User.GetProperty("picture").GetString();
            context.Identity.AddClaim(new Claim("picture", picture));

            return Task.CompletedTask;
        };
    })
    .AddCookie();
builder.Services.AddScoped<IRepositoryManager, RepositoryManager>();
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.Configure<CookiePolicyOptions>(options =>
{
    options.CheckConsentNeeded = context => true;
    options.MinimumSameSitePolicy = SameSiteMode.Strict;
});
//builder.Services.AddAutoMapper(typeof(MappingProfile));
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
}
app.UseSwagger();
app.UseSwaggerUI();

app.UseAuthorization();
app.UseAuthentication();
app.UseCookiePolicy(new CookiePolicyOptions
{
    Secure = CookieSecurePolicy.Always
});
app.MapControllers();

app.Run();