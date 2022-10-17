namespace reciWebApp.Data.Pagination
{
    public class FilterAndSortPostParams : PaginationParams
    {
        public string? Search { get; set; }
        public List<string>? Method { get; set; }
        public List<string>? Continent { get; set; }
        public string? Sort { get; set; }
        public List<string>? Category { get; set; }
        public List<string>? Uses { get; set; }
        public List<string>? Collection { get; set; }
    }
}
