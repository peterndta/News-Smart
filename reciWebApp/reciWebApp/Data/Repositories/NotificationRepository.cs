using Microsoft.EntityFrameworkCore;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.DTOs.NotificationDTOs;
using reciWebApp.Services.Commons;

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

        public List<ShowNotificationDTO> SortNotificationsByCondition(List<ShowNotificationDTO> shows, string sort)
        {
            if (sort.Equals(SortTypes.Newest))
            {
                shows = shows.OrderByDescending(x => x.CreateDate).ToList();
            }
            else if (sort.Equals(SortTypes.Oldest))
            {
                shows = shows.OrderBy(x => x.CreateDate).ToList();
            }

            return shows;
        }

        public void UpdateNotification(Notification notification)
        {
            Update(notification);
        }
    }
}
