namespace reciWebApp.Data.Pagination
{
    public class FilterByMethodParams : PaginationParams
    {
        public string? Search { get; set; }
        public List<string>? Method { get; set; }
        public string? Sort { get; set; }
    }
}
