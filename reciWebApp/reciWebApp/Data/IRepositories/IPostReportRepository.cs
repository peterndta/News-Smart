using reciWebApp.Data.Models;
using reciWebApp.Data.Pagination;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.DTOs.PostReportDTO;
using reciWebApp.Services.Utils;

namespace reciWebApp.Data.IRepositories
{
    public interface IPostReportRepository
    {
        void CreatePostReport(PostReport report);
        void DenyReport(PostReport report);
        Task ApproveReportAsync(string postReportId);

        PostReport GetPostReportById(int id);
        Task<PostReport> GetPostReportByIdAsync(int id);
        bool CheckReport(int userId, string postId);
    }
}
