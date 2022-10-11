using reciWebApp.Data.Pagination;

namespace reciWebApp.DTOs.PostDTOs
{
    public class FilterAndSortPostDTO : PaginationParams
    {
        public string? Search { get; set; }
        public string? Method { get; set; }
        public string? Continent { get; set; }
        public string? Sort { get; set; }
        public List<string>? Category { get; set; }
    }
}
