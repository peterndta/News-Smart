namespace reciWebApp.DTOs.PostDTOs
{
    public class ShowPostsHighRating
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string? ImageUrl { get; set; }
        public decimal? AverageRating { get; set; }
        public DateTime? CreateDate { get; set; }
    }
}
