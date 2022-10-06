namespace reciWebApp.Data.Pagination
{
    public class PostParams : PaginationParams
    {
        public string? Name { get; set; }
        public int? CookingMethodId { get; set; }
        public int? RecipeTypeId { get; set; }
        public int? CategoryId { get; set; }
    }
}
