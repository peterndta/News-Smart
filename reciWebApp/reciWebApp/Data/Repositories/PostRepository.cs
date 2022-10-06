using Microsoft.EntityFrameworkCore;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.Data.Pagination;
using reciWebApp.Data.Repositories.Extensions;
using reciWebApp.Services.Utils;

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

        public void UpdatePost(Post post)
        {
            Update(post);
        }

        public Post GetPostById(string id)
        {
            return GetByCondition(x => x.Id.Equals(id)).FirstOrDefault();
        }

        public async Task<Post> GetPostByIdAsync(string id)
        {
            return await GetByCondition(x => x.Id.Equals(id)).SingleOrDefaultAsync();
        }

        public async Task<List<Post>?> GetPostByUserIdAsync(int id)
        {
            return await GetByCondition(x => x.UserId == id).ToListAsync();
        }

        public async Task<PaginatedList<Post>?> GetAllPostsAsync(PostParams postParams)
        {
            var post = await GetAll()
                .FilterPostByName(_reciContext, postParams.Name)
                .FilterPostByCategoryId(_reciContext, postParams.CategoryId)
                .FilterPostByCookingMethodId(_reciContext, postParams.CookingMethodId)
                .FilterPostByRecipeTypeId(_reciContext, postParams.RecipeTypeId)
                .ToListAsync();
            return PaginatedList<Post>.Create(post, postParams.PageNumber, postParams.PageSize);
        }
    }
}
