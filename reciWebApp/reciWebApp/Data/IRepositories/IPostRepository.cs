using reciWebApp.Data.Models;

namespace reciWebApp.Data.IRepositories
{
    public interface IPostRepository
    {
        Task<Post> GetPostByIdAsyns(string id);
        Task<List<Post>> GetPostByUserIdAsyns(int id);
        void CreatePost(Post post);
        Post GetPostById(string id);
        void DeletePost(Post post); 
        void UpdatePost(Post post);
    }
}
