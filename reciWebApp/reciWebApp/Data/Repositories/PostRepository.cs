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
                //.FilterPostByPostCategory(_reciContext, postParams.Posts)
                .FilterPostByCookingMethodId(_reciContext, postParams.CookingMethodId)
                .FilterPostByRecipeTypeId(_reciContext, postParams.RecipeTypeId)
                .ToListAsync();
            var result = post.Intersect(postParams.Posts).ToList();
            return PaginatedList<Post>.Create(result, postParams.PageNumber, postParams.PageSize);
        }

        public async Task<PaginatedList<Post>?> GetAllPostsByUserIdAsync(PostParams postParams, int userId)
        {
            var post = await GetByCondition(x => x.UserId == userId)
                .FilterPostByName(_reciContext, postParams.Name)
                .FilterPostByPostCategory(_reciContext, postParams.Posts)
                .FilterPostByCookingMethodId(_reciContext, postParams.CookingMethodId)
                .FilterPostByRecipeTypeId(_reciContext, postParams.RecipeTypeId)
                .ToListAsync();
            var result = post.Intersect(postParams.Posts).ToList();
            return PaginatedList<Post>.Create(result, postParams.PageNumber, postParams.PageSize);
        }

        public List<Post> GetPostsByPostCategories(List<PostCategory?> postCategories)
        {
            var posts = GetAll().ToList();
            if (postCategories.Count > 0)
            {
                List<Post> result = new List<Post>();
                postCategories.DistinctBy(x => x.PostId);
                foreach(var postCategory in postCategories)
                {
                    result.Add(GetPostById(postCategory.PostId));
                }
                return result;
            }
            return posts;
        }
    }
}
