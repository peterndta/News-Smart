namespace reciWebApp.DTOs.PostDTOs
{
    public class ShowPostDTO
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? UpdateDate { get; set; }
        public int CookingMethodId { get; set; }
        public string? Method { get; set; }
        public int RecipeRegionId { get; set; }
        public string? Continents { get; set; }
        public int UserId { get; set; }
        public int? Status { get; set; }
        public string? ImageUrl { get; set; }
        public string? VideoUrl { get; set; }
        public int CategoryId { get; set; }
        public string? Type { get; set; }
    }
}
