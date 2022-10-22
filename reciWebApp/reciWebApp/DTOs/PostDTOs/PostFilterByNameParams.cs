using reciWebApp.Data.Pagination;

namespace reciWebApp.DTOs.PostDTOs
{
    public class PostFilterByNameParams : PaginationParams
    {
        public string Name { get; set; }
    }
}
