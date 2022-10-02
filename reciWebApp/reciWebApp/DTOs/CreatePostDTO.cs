namespace reciWebApp.DTOs
{
    public class CreatePostDTO
    {
        public string Id { get; set; }
        public string? Name { get; set; }
        public int? CookingMethodId { get; set; }
        public int? RecipeTypeId { get; set; }
        public int? UserId { get; set; }
        public int? Status { get; set; }
        public string? ImageUrl { get; set; }
        public string? VideoUrl { get; set; }
        public int? CategoryId { get; set; }
        public DateTime? CreateDate { get; } = DateTime.Now;
        public DateTime? UpdateDate { get; } = DateTime.Now;
    }
}
