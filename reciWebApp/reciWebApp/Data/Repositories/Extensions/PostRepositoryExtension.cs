using Google;
using reciWebApp.Data.Models;

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

        public static IQueryable<Post> FilterPostByCookingMethodId(this IQueryable<Post> posts, ReciContext context,
            int? id)
        {
            return id == null 
                ? posts
                : posts.Where(x => x.CookingMethodId == id);
        }

        public static IQueryable<Post> FilterPostByRecipeTypeId(this IQueryable<Post> posts, ReciContext context,
            int? id)
        {
            return id == null
                ? posts
                : posts.Where(x => x.RecipeRegionId == id);
        }

        public static IQueryable<Post> FilterPostByCategoryId(this IQueryable<Post> posts, ReciContext context,
            int? id)
        {
            return id == null
                ? posts
                : posts.Where(x => x.CategoryId == id);
        }
    }
}
