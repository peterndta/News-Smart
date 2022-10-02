using reciWebApp.Data.Models;

namespace reciWebApp.Data.IRepositories
{
    public interface IPostRepository
    {
        Task<Post> GetPostById(string id);
        Task<List<Post>> GetPostByUserId(int id);
        void CreatePost(Post post);
    }
}
