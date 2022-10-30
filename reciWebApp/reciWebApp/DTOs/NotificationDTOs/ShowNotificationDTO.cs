namespace reciWebApp.DTOs.NotificationDTOs
{
    public class ShowNotificationDTO
    {
        public int Id { get; set; }
        public int PostReportId { get; set; }
        public string? Message { get; set; }
        public DateTime? CreateDate { get; set; }
        public bool? HaveSeen { get; set; }
    }
}
