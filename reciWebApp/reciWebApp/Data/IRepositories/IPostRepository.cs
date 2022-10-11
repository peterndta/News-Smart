﻿using reciWebApp.Data.Models;
using reciWebApp.Data.Pagination;
using reciWebApp.Services.Utils;

namespace reciWebApp.Data.IRepositories
{
    public interface IPostRepository
    {
        Task<Post> GetPostByIdAsync(string id);
        Task<List<Post>> GetPostByUserIdAsync(int id);
        void CreatePost(Post post);
        Post GetPostById(string id);
        void DeletePost(Post post); 
        void UpdatePost(Post post);
        List<Post?> GetPostsByPostCategories(List<PostCategory> postCategories);
        Task<PaginatedList<Post>?> GetAllPostsAsync(PostParams postParams);
        Task<PaginatedList<Post>?> GetAllPostsByUserIdAsync(PostParams postParams, int userId);
    }
}
