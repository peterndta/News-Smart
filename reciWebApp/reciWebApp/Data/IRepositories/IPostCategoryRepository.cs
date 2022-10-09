using reciWebApp.Data.Models;

namespace reciWebApp.Data.IRepositories
{
    public interface IPostCategoryRepository
    {
        void CreatePostCategory(PostCategory postCategory);
    }
}