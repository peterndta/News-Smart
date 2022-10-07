using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class Post
    {
        public Post()
        {
            FoodCollections = new HashSet<FoodCollection>();
            PostMeta = new HashSet<PostMetum>();
            PostReports = new HashSet<PostReport>();
            Steps = new HashSet<Step>();
            UserInteracts = new HashSet<UserInteract>();
            UsesOfFoods = new HashSet<UsesOfFood>();
        }

        public string Id { get; set; } = null!;
        public string? Name { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? UpdateDate { get; set; }
        public int? CookingMethodId { get; set; }
        public int? RecipeTypeId { get; set; }
        public int? UserId { get; set; }
        public int? Status { get; set; }
        public string? ImageUrl { get; set; }
        public string? VideoUrl { get; set; }
        public int? CategoryId { get; set; }

        public virtual Category? Category { get; set; }
        public virtual CookingMethod? CookingMethod { get; set; }
        public virtual RecipeRegion? RecipeType { get; set; }
        public virtual User? User { get; set; }
        public virtual ICollection<FoodCollection> FoodCollections { get; set; }
        public virtual ICollection<PostMetum> PostMeta { get; set; }
        public virtual ICollection<PostReport> PostReports { get; set; }
        public virtual ICollection<Step> Steps { get; set; }
        public virtual ICollection<UserInteract> UserInteracts { get; set; }
        public virtual ICollection<UsesOfFood> UsesOfFoods { get; set; }

        public void PostMock()
        {
            var posts = new List<Post>()
            {
                new Post
            {
                Id = "1",
                Name = "Post 1",
                CreateDate = new DateTime (2022, 09, 27),
                UpdateDate = new DateTime (2022, 09, 28),
                CookingMethodId = 1,
                RecipeTypeId = 1,
                UserId = 1,
                Status = 1,
                ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
                VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
                CategoryId = 1,
            },
                new Post
            {
                Id = "2",
                Name = "Post 2",
                CreateDate = new DateTime (2022, 09, 27),
                UpdateDate = new DateTime (2022, 09, 28),
                CookingMethodId = 2,
                RecipeTypeId = 2,
                UserId = 2,
                Status = 2,
                ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
                VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
                CategoryId = 2,
            },
                new Post
            {
                Id = "3",
                Name = "Post 3",
                CreateDate = new DateTime (2022, 09, 27),
                UpdateDate = new DateTime (2022, 09, 28),
                CookingMethodId = 3,
                RecipeTypeId = 3,
                UserId = 3,
                Status = 3,
                ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
                VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
                CategoryId = 3,
            },
                new Post
            {
                Id = "4",
                Name = "Post 4",
                CreateDate = new DateTime (2022, 09, 27),
                UpdateDate = new DateTime (2022, 09, 28),
                CookingMethodId = 4,
                RecipeTypeId = 4,
                UserId = 4,
                Status = 4,
                ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
                VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
                CategoryId = 4,
            },
                new Post
            {
                Id = "5",
                Name = "Post 5",
                CreateDate = new DateTime (2022, 09, 27),
                UpdateDate = new DateTime (2022, 09, 28),
                CookingMethodId = 5,
                RecipeTypeId = 5,
                UserId = 5,
                Status = 5,
                ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
                VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
                CategoryId = 5,
            },
                new Post
            {
                Id = "6",
                Name = "Post 6",
                CreateDate = new DateTime (2022, 09, 27),
                UpdateDate = new DateTime (2022, 09, 28),
                CookingMethodId = 6,
                RecipeTypeId = 6,
                UserId = 6,
                Status = 6,
                ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
                VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
                CategoryId = 6,
            },
                new Post
            {
                Id = "7",
                Name = "Post 7",
                CreateDate = new DateTime (2022, 09, 27),
                UpdateDate = new DateTime (2022, 09, 28),
                CookingMethodId = 7,
                RecipeTypeId = 7,
                UserId = 7,
                Status = 7,
                ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
                VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
                CategoryId = 7,
            },
                new Post
            {
                Id = "8",
                Name = "Post 8",
                CreateDate = new DateTime (2022, 09, 27),
                UpdateDate = new DateTime (2022, 09, 28),
                CookingMethodId = 8,
                RecipeTypeId = 8,
                UserId = 8,
                Status = 8,
                ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
                VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
                CategoryId = 8,
            },
                new Post
            {
                Id = "9",
                Name = "Post 9",
                CreateDate = new DateTime (2022, 09, 27),
                UpdateDate = new DateTime (2022, 09, 28),
                CookingMethodId = 9,
                RecipeTypeId = 9,
                UserId = 9,
                Status = 9,
                ImageUrl = "https://recipes.timesofindia.com/thumb/61589069.cms?width=1200&height=900",
                VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
                CategoryId = 9,
            },
                new Post
            {
                Id = "10",
                Name = "Post 10",
                CreateDate = new DateTime (2022, 09, 27),
                UpdateDate = new DateTime (2022, 09, 28),
                CookingMethodId = 10,
                RecipeTypeId = 10,
                UserId = 10,
                Status = 10,
                ImageUrl = "https://recipes.timesofindia.com/thumb/61589069.cms?width=1200&height=900",
                VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
                CategoryId = 10,
            },
            };

            posts.AddRange(posts);
        }
    }
}
