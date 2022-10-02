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

        public async Task<Post> GetPostById(string id)
        {
            return await GetByCondition(x => x.Id == id).SingleOrDefaultAsync();
        }

        public async Task<List<Post>?> GetPostByUserId(int id)
        {
            return await GetByCondition(x => x.UserId == id).ToListAsync();
        }
    }
}
