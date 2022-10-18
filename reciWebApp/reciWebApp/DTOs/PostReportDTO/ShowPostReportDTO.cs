namespace reciWebApp.DTOs.PostReportDTO
{
    public class ShowPostReportDTO
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string PostsId { get; set; } 
        public string Reason { get; set; } 
        public int Status { get; set; }
    }
}
