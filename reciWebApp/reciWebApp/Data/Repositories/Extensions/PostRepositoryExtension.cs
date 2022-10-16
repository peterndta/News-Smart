using Google;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Query.Internal;
using reciWebApp.Data.Models;
using System.Linq;

namespace reciWebApp.Data.Repositories.Extensions
{
    public static class PostRepositoryExtension
    {
        public static IQueryable<Post> FilterPostByName(this IQueryable<Post> posts, ReciContext context,
            string? name)
        {
            return string.IsNullOrWhiteSpace(name) 
                ? posts
                : posts.Where(x => x.Name.Contains(name));
        }
    }
}
