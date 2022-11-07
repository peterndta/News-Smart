using reciWebApp.DTOs.PostDTOs;
using reciWebApp.DTOs.UseDTOs;
using reciWebApp.DTOs.UserDTOs;

namespace reciWebApp.DTOs
{
    public class StatisDTO
    {
        public int TotalPosts { get; set; }
        public int TotalAccounts { get; set; }
        public List<ShowTopPostsByBookmark> TopPostByBookmark { get; set; }
        public List<TopUserHighRating> TopUserByHighRating { get; set; }
        public List<TopUserMostPosts> TopUserByHighPost { get; set; }
        public int TotalReport { get; set; }
        public int TotalBookmark { get; set; }
        public List<ShowPostsHighRating> PostsWithHighRating { get; set; }
    }
}
