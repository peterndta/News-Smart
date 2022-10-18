namespace reciWebApp.Data.Pagination
{
    public class FilterByCategoryParams : PaginationParams
    {
        public string? Search { get; set; }
        public string? Sort { get; set; }
        public List<string>? Category { get; set; }
    }
}
