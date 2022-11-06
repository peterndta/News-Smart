using Microsoft.EntityFrameworkCore;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.Data.Pagination;
using reciWebApp.Data.Repositories.Extensions;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.DTOs.PostReportDTO;
using reciWebApp.Services.Utils;
using reciWebApp.DTOs.PostReportDTO;
using reciWebApp.Services.Commons;

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
        
        public List<PostReport> GetPendingPostReportByPostId (string postId)
        {
            return GetByCondition(x => x.PostsId.Equals(postId) && x.Status == ReportStatus.Pending).ToList();
        }

        public async Task<List<PostReport>> GetPendingReportByPostIdAsync (string postId)
        {
            return await GetByCondition(x => x.PostsId.Equals(postId) && x.Status == ReportStatus.Pending).ToListAsync();
        }

        public async Task ApproveReportAsync(int postReportId)
        {
            var report = await GetByCondition(x => x.Id == postReportId).FirstAsync();
            report.Status = ReportStatus.Approve;
            Update(report);
            var listReport = await GetByCondition(x => x.PostsId.Equals(report.PostsId) && x.Id != report.Id).ToListAsync();
            if (listReport.Count > 0)
            {
                BulkDelete(listReport);
            }
        }

        public async Task<PostReport?> GetApprovedReportByPostIdAsync(string postId)
        {
            var report = await GetByCondition(x => x.PostsId.Equals(postId) && x.Status == ReportStatus.Approve).SingleOrDefaultAsync();
            return report;
        }

        public async Task<int> TotalReportAsync()
        {
            return await GetAll().CountAsync();
        }
    }
}
