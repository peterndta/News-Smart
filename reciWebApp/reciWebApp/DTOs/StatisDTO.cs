using reciWebApp.DTOs.PostDTOs;
using reciWebApp.DTOs.UseDTOs;

namespace reciWebApp.DTOs
{
    public class StatisDTO
    {
        public int TotalPosts { get; set; }
        public int TotalAccounts { get; set; }
        public List<ShowDetailPostDTO> TopPostByBookmark { get; set; }
        public List<ShowUseDTO> TopUserByHighRating { get; set; }
        public List<ShowUseDTO> TopUserByHighPost { get; set; }
    }
}
