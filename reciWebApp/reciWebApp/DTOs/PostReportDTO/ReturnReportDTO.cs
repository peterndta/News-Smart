namespace reciWebApp.DTOs.PostReportDTO
{
    public class ReturnReportDTO
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string PostsId { get; set; }
        public string UserName { get; set; }
        public string PostName { get; set; }
        public string PostDescription { get; set; }
        public string Reason { get; set; }
        public int Status { get; set; }
        public double Rating { get; set; }
    }
}
