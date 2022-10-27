using Microsoft.EntityFrameworkCore;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.Data.Pagination;
using reciWebApp.Data.Repositories.Extensions;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.DTOs.PostReportDTO;
using reciWebApp.Services.Utils;
using reciWebApp.DTOs.PostReportDTO;

namespace reciWebApp.Data.Repositories
{
    public class PostReportRepository : RepositoryBase<PostReport>, IPostReportRepository
    {
        public PostReportRepository(ReciContext reciContext) : base(reciContext)
        {
        }

        public void CreatePostReport (PostReport report)
        {
            Create(report);
        }

        public void DenyReport (PostReport report)
        {
            report.Status = 2;
            Delete(report);
        }

        public PostReport GetPostReportById (int id)
        {
            return GetByCondition(x => x.Id == id).SingleOrDefault();
        }

        public Task<PostReport> GetPostReportByIdAsync(int id)
        {
            return GetByCondition(x => x.Id == id).SingleOrDefaultAsync();
        }

        public bool CheckReport(int userId, string postId)
        {
            var report = GetByCondition(x => x.UserId == userId && x.PostsId.Equals(postId)).FirstOrDefault();
            return report != null;
        }

        public async Task ApproveReportAsync(string postReportId)
        {
            var reportList = await GetByCondition(x => x.PostsId.Equals(postReportId)).ToListAsync();
            foreach (var report in reportList)
            {
                report.Status = 1;
                Update(report);
            }
        }
    }
}
