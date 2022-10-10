namespace reciWebApp.DTOs.PostDTOs
{
    public class UpdatePostDTO
    {
        public string Name { get; set; }
        public int CookingMethodId { get; set; }
        public int RecipeRegionId { get; set; }
        public string? ImageUrl { get; set; }
        public string? VideoUrl { get; set; }
        public int CategoryId { get; set; }
        public DateTime? UpdateDate { get; } = DateTime.Now;
    }
}
