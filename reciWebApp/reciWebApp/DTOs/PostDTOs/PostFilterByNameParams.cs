using reciWebApp.Data.Pagination;

namespace reciWebApp.DTOs.PostDTOs
{
    public class PostFilterByNameParams : PaginationParams
    {
        public string? Search { get; set; }
    }
}
