namespace reciWebApp.Data.Pagination
{
    public class FilterByCollectionParams : PaginationParams
    {
        //public string? Search { get; set; }
        public string? Sort { get; set; }
        public string Collection { get; set; }
    }
}
