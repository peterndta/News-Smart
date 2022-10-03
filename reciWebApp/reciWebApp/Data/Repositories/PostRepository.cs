using Microsoft.EntityFrameworkCore;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;

namespace reciWebApp.Data.Repositories
{
    public class PostRepository : RepositoryBase<Post>, IPostRepository
    {
        public PostRepository(ReciContext reciContext) : base(reciContext)
        {
        }

        public void CreatePost(Post post)
        {
            Create(post);
        }

        public void DeletePost(Post post)
        {
            Delete(post);
        }

        public Post GetPostById(string id)
        {
            return GetByCondition(x => x.Id.Equals(id)).FirstOrDefault();
        }

        public async Task<Post> GetPostByIdAsyns(string id)
        {
            return await GetByCondition(x => x.Id.Equals(id)).SingleOrDefaultAsync();
        }

        public async Task<List<Post>?> GetPostByUserIdAsyns(int id)
        {
            return await GetByCondition(x => x.UserId == id).ToListAsync();
        }

        public void UpdatePost(Post post)
        {
            Update(post);
        }
    }
}
