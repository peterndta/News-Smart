using reciWebApp.DTOs.CategoryDTOs;

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
        public string? Description { get; set; }
        public string? Continents { get; set; }
        public int UserId { get; set; }
        public int? Status { get; set; }
        public string? ImageUrl { get; set; }
        public string? VideoUrl { get; set; }
        public List<ShowCategoryDTO> ListCategories { get; set; }
        public string UserName { get; set; }
    }
}
