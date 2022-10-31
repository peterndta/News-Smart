using Microsoft.EntityFrameworkCore;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;

namespace reciWebApp.Data.Repositories
{
    public class NotificationRepository : RepositoryBase<Notification>, INotificationRepository
    {
        public NotificationRepository(ReciContext reciContext) : base(reciContext)
        {
        }

        public void CreateNotification(Notification notification)
        {
            Create(notification);
        }

        public async Task<Notification?> GetNewNotificationByReportId(int reportId)
        {
            return await GetByCondition(x => x.PostReportId == reportId && x.HaveSeen == false).SingleOrDefaultAsync();
        }

        public async Task<Notification?> GetNotificationByReportId(int reportId)
        {
            return await GetByCondition(x => x.PostReportId == reportId).SingleOrDefaultAsync();
        }

        public void UpdateNotification(Notification notification)
        {
            Update(notification);
        }
    }
}
