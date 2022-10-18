using reciWebApp.Data.Models;
using reciWebApp.Data.Pagination;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.Services.Utils;

namespace reciWebApp.Data.IRepositories
{
    public interface IPostReportRepository
    {
        void CreatePostReport(PostReport report);
        void DenyReport(PostReport report);

        PostReport GetPostReportById(int id);
        Task<PostReport> GetPostReportByIdAsync(int id);
    }
}
