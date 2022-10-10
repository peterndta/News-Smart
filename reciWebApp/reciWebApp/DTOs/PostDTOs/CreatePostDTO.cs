namespace reciWebApp.DTOs.PostDTOs
{
    public class CreatePostDTO
    {
        public string? Name { get; set; }
        public int? CookingMethodId { get; set; }
        public int? RecipeRegionId { get; set; }
        public string? ImageUrl { get; set; }
        public string? VideoUrl { get; set; }
        public DateTime? CreateDate { get; } = DateTime.Now;
        public DateTime? UpdateDate { get; } = DateTime.Now;
        public int? UsesId { get; set; }
        public string? Description { get; set; }
        public List<int> CategoriesId { get; set; }
        public string Ingredient { get; set; }
        public string Processing { get; set; }
        public string Cooking { get; set; }
        public string? Tool { get; set; }
        public int? ProcessingTime { get; set; }
        public int? CookingTime { get; set; }
        public int? PreparingTime { get; set; }
        public int? Serving { get; set; }
    }
}
