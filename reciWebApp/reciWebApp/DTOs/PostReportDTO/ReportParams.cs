using reciWebApp.Data.Pagination;

namespace reciWebApp.DTOs.PostReportDTO
{
    public class ReportParams : PaginationParams
    {
        public string postName { get; set; }
    }
}
