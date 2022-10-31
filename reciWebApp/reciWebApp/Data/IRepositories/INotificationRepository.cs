using reciWebApp.Data.Models;

namespace reciWebApp.Data.IRepositories
{
    public interface INotificationRepository
    {
        void CreateNotification(Notification notification);
        Task<Notification?> GetNotificationByReportId(int reportId);
        Task<Notification?> GetNewNotificationByReportId(int reportId);
        void UpdateNotification(Notification notification);
    }
}
