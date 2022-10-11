using reciWebApp.Data.Pagination;

namespace reciWebApp.DTOs.PostDTOs
{
    public class FilterAndSortPostDTO : PaginationParams
    {
        public string? Name { get; set; }
        public string? CookingMethod { get; set; }
        public string? RecipeType { get; set; }
        public string? Sort { get; set; }
        public List<string>? Categories { get; set; }
    }
}
