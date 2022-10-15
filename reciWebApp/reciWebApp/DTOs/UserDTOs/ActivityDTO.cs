namespace reciWebApp.DTOs.UserDTOs
{
    public class ActivityDTO
    {
        public int TotalPosts { get; set; }
        public int TotalBookmarks { get; set; }
        public int TotalRatings { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string? ImageUrl { get; set; }
    }
}
