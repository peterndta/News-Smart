using reciWebApp.Data.Pagination;

namespace reciWebApp.DTOs.UserDTOs
{
    public class UserParams : PaginationParams
    {
        public string? Name { get; set; }
        public bool Status { get; set; }
    }
}
