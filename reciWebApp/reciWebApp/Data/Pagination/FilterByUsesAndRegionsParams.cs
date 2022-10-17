namespace reciWebApp.Data.Pagination
{
    public class FilterByUsesAndRegionsParams : PaginationParams
    {
        public string? Search { get; set; }
        public List<string>? Continent { get; set; }
        public string? Sort { get; set; }
        public List<string>? Uses { get; set; }
    }
}
