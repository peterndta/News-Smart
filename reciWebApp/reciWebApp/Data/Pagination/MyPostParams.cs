using reciWebApp.Data.Models;

namespace reciWebApp.Data.Pagination
{
    public class MyPostParams : PaginationParams
    {
        public string? Search { get; set; }
        public string? Sort { get; set; }
    }
}
