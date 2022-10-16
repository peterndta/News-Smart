using reciWebApp.Data.Models;

namespace reciWebApp.Data.Pagination
{
    public class PostParams : PaginationParams
    {
        public string? Name { get; set; }
        public List<Post?> PostsByCookingMethods { get; set; }
        public List<Post?> PostsRecipeRegions { get; set; }
        public string? Type { get; set; }
        public List<Post?> PostsByCategories { get; set; }
        public List<Post?> PostsByUses { get; set; }
    }
}
