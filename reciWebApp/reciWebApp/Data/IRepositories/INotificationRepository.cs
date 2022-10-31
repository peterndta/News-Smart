using reciWebApp.Data.Models;
using reciWebApp.DTOs.NotificationDTOs;

namespace reciWebApp.Data.IRepositories
{
    public interface INotificationRepository
    {
        void CreateNotification(Notification notification);
        Task<Notification?> GetNotificationByReportId(int reportId);
        Task<Notification?> GetNewNotificationByReportId(int reportId);
        void UpdateNotification(Notification notification);
        List<ShowNotificationDTO> SortNotificationsByCondition(List<ShowNotificationDTO> shows, string sort);
    }
}
