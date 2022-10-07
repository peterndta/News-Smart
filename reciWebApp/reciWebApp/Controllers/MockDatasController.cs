using Microsoft.AspNetCore.Mvc;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace reciWebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MockDatasController : ControllerBase
    {
        private readonly ReciContext _reciContext;
        public MockDatasController(ReciContext reciContext)
        {
            _reciContext = reciContext;
        }
        // GET: api/<MockDatasController>
        [HttpGet]
        public void Get()
        {
            //var categories = new List<Category>()
            //{
            //    new Category
            //    {
            //        Type = "Category 1",
            //    },
            //    new Category
            //    {
            //        Type = "Category 2",
            //    }, new Category
            //    {
            //        Type = "Category 3",
            //    },
            //    new Category
            //    {
            //        Type = "Category 4",
            //    },
            //    new Category
            //    {
            //        Type = "Category 5",
            //    },
            //    new Category
            //    {
            //        Type = "Category 6",
            //    },
            //    new Category
            //    {
            //        Type = "Category 7",
            //    },
            //    new Category
            //    {
            //        Type = "Category 8",
            //    },
            //    new Category
            //    {
            //        Type = "Category 9",
            //    },
            //    new Category
            //    {
            //        Type = "Category 10",
            //    }
            //};
            //for  (int i = 0; i < categories.Count(); i++)
            //{
            //    _reciContext.Categories.Add(categories[i]);
            //}
            //var cookingMethods = new List<CookingMethod>()
            //{
            //    new CookingMethod
            //    {
            //        Method = "Method 1",
            //    },
            //    new CookingMethod
            //    {
            //        Method = "Method 2",
            //    },
            //    new CookingMethod
            //    {
            //        Method = "Method 3",
            //    },
            //    new CookingMethod
            //    {
            //        Method = "Method 4",
            //    },
            //    new CookingMethod
            //    {
            //        Method = "Method 5",
            //    },
            //    new CookingMethod
            //    {
            //        Method = "Method 6",
            //    },
            //    new CookingMethod
            //    {
            //        Method = "Method 7",
            //    },
            //    new CookingMethod
            //    {
            //        Method = "Method 8",
            //    },
            //    new CookingMethod
            //    {
            //        Method = "Method 9",
            //    },
            //    new CookingMethod
            //    {
            //        Method = "Method 10",
            //    }
            //};

            //for (int i = 0; i < cookingMethods.Count(); i++)
            //{
            //    _reciContext.CookingMethods.Add(cookingMethods[i]);
            //}
            //var reciRegions = new List<RecipeRegion>()
            //{
            //    new RecipeRegion
            //{
            //    Country = "Viet Nam",
            //    Region = "Ha Noi",
            //},
            //    new RecipeRegion
            //{
            //    Country = "Viet Nam",
            //    Region = "Sai Gon",
            //},
            //    new RecipeRegion
            //{
            //    Country = "Viet Nam",
            //    Region = "Da Nang",
            //},
            //    new RecipeRegion
            //{
            //    Country = "Italia",
            //    Region = "Europe",
            //},
            //    new RecipeRegion
            //{
            //    Country = "Russia",
            //    Region = "Europe",
            //},
            //    new RecipeRegion
            //{
            //    Country = "UK",
            //    Region = "Europe",
            //},
            //    new RecipeRegion
            //{
            //    Country = "Mexico",
            //    Region = "America",
            //},
            //    new RecipeRegion
            //{
            //    Country = "USA",
            //    Region = "America",
            //},
            //    new RecipeRegion
            //{
            //    Country = "Thai Lan",
            //    Region = "Asia",
            //},
            //    new RecipeRegion
            //{
            //    Country = "Japan",
            //    Region = "Asia",
            //},
            //};
            //for (int i = 0; i < reciRegions.Count(); i++)
            //{
            //    _reciContext.RecipeRegions.Add(reciRegions[i]);
            //}
            //var users = new List<User>()
            //{
            //    new User
            //    {
            //        Name = "Trung Nguyen",
            //        Email= "nktnguyen2001@gmail.com",
            //        Role = "user",
            //        ImageUrl = "https://media.istockphoto.com/photos/illustration-of-smiling-happy-man-with-laptop-sitting-in-armchair-picture-id1226886130?s=612x612",
            //    },
            //    new User
            //    {
            //        Name = "Fan of Trực tiếp game",
            //        Email= "hienbui27g@gmail.com",
            //        Role = "user",
            //        ImageUrl = "https://lh3.googleusercontent.com/a/ALm5wu3I62Szj5gMdkwQDUpJmGJSIyzbL06V7LURjP10=s96-c",
            //    },
            //    new User
            //    {
            //        Name = "Bui The Hien (K15 HCM)",
            //        Email = "hienbtse150763@fpt.edu.vn",
            //        Role = "user",
            //        ImageUrl = "https://lh3.googleusercontent.com/a-/ACNPEu_VlpT8BjDZtWTirWSahbzYpYhwpH9hCZhQsg5I=s96-c",
            //    },
            //    new User
            //    {
            //        Name = "Phát Gia",
            //        Email = "phatduong0812@gmail.com",
            //        Role = "user",
            //        ImageUrl = "https://lh3.googleusercontent.com/a/ALm5wu37HCmpJf5pX59zLGdbWCsmwKRz1LBec3I3hOqm=s96-c",
            //    },
            //    new User
            //    {
            //        Name = "Nguyen Van Bao Khuong (K15 HCM)",
            //        Email = "khuongnvbse150856@fpt.edu.vn",
            //        Role = "user",
            //        ImageUrl = "https://lh3.googleusercontent.com/a/ALm5wu2dpW4_ePFsm9m9tg3sr1IcsbZN27YnkrC7mK6G=s96-c",
            //    },
            //    new User
            //    {
            //        Name = "Warlock Wesker",
            //        Email = "khuongvladimir2001@gmail.com",
            //        Role = "user",
            //        ImageUrl = "https://lh3.googleusercontent.com/a-/ACNPEu8Bgm8DeuSBa86iazOqkRZRsDrOjrjbCnWjPL9v",
            //    },
            //    new User
            //    {
            //        Name = "Mai Phước Sự",
            //        Email = "sumpse151028@fpt.edu.vn",
            //        Role = "user",
            //        ImageUrl = "https://lh3.googleusercontent.com/a-/ACNPEu9M318BFv9v8dYUmwAaKWhApb-w37Tw43N3yE5O=s96-c",
            //    },
            //    new User
            //    {
            //        Name = "NiceGuyPete",
            //        Email = "psky4477@gmail.com",
            //        Role = "user",
            //        ImageUrl = "https://lh3.googleusercontent.com/a/ALm5wu1_nkTPhlpj2mMQBgDjBvec__jBVKj34VDFc2_S4g=s96-c",
            //    },
            //    new User
            //    {
            //        Name = "Nguyen Hoai Thuong (K15 HCM)",
            //        Email = "thuongnhse151099@fpt.edu.vn",
            //        Role = "user",
            //        ImageUrl = "https://lh3.googleusercontent.com/a-/ACNPEu_q40D5ooBPnRLbS35yF1a4IEuFEC4yRWJZBy9CFQ=s96-c",
            //    },
            //    new User
            //    {
            //        Name = "Duong Gia Phat",
            //        Email = "phatdgse140409@fpt.edu.vn",
            //        Role = "user",
            //        ImageUrl = "https://lh3.googleusercontent.com/a-/ACNPEu-7BttAstWby2g7HjGyuTjvdi6vHacPB_N5ms3b1g=s96-c",
            //    }
            //};
            //for (int i = 0; i < users.Count(); i++)
            //{
            //    _reciContext.Users.Add(users[i]);
            //}
            //var posts = new List<Post>()
            //{
            //    new Post
            //{
            //    Id = "1",
            //    Name = "Post 1",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 1,
            //    RecipeTypeId = 1,
            //    UserId = 1,
            //    Status = 1,
            //    ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    CategoryId = 1,
            //},
            //    new Post
            //{
            //    Id = "2",
            //    Name = "Post 2",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 2,
            //    RecipeTypeId = 2,
            //    UserId = 2,
            //    Status = 2,
            //    ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    CategoryId = 2,
            //},
            //    new Post
            //{
            //    Id = "3",
            //    Name = "Post 3",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 3,
            //    RecipeTypeId = 3,
            //    UserId = 3,
            //    Status = 3,
            //    ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    CategoryId = 3,
            //},
            //    new Post
            //{
            //    Id = "4",
            //    Name = "Post 4",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 4,
            //    RecipeTypeId = 4,
            //    UserId = 4,
            //    Status = 4,
            //    ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    CategoryId = 4,
            //},
            //    new Post
            //{
            //    Id = "5",
            //    Name = "Post 5",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 5,
            //    RecipeTypeId = 5,
            //    UserId = 5,
            //    Status = 5,
            //    ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    CategoryId = 5,
            //},
            //    new Post
            //{
            //    Id = "6",
            //    Name = "Post 6",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 6,
            //    RecipeTypeId = 6,
            //    UserId = 6,
            //    Status = 6,
            //    ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    CategoryId = 6,
            //},
            //    new Post
            //{
            //    Id = "7",
            //    Name = "Post 7",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 7,
            //    RecipeTypeId = 7,
            //    UserId = 7,
            //    Status = 7,
            //    ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    CategoryId = 7,
            //},
            //    new Post
            //{
            //    Id = "8",
            //    Name = "Post 8",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 8,
            //    RecipeTypeId = 8,
            //    UserId = 8,
            //    Status = 8,
            //    ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    CategoryId = 8,
            //},
            //    new Post
            //{
            //    Id = "9",
            //    Name = "Post 9",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 9,
            //    RecipeTypeId = 9,
            //    UserId = 9,
            //    Status = 9,
            //    ImageUrl = "https://recipes.timesofindia.com/thumb/61589069.cms?width=1200&height=900",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    CategoryId = 9,
            //},
            //    new Post
            //{
            //    Id = "10",
            //    Name = "Post 10",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 10,
            //    RecipeTypeId = 10,
            //    UserId = 10,
            //    Status = 10,
            //    ImageUrl = "https://recipes.timesofindia.com/thumb/61589069.cms?width=1200&height=900",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    CategoryId = 10,
            //},
            //};
            //for (int i = 0; i < posts.Count(); i++)
            //{
            //    _reciContext.Posts.Add(posts[i]);
            //}
            //var useOfFoods = new List<UsesOfFood>()
            //{
            //    new UsesOfFood
            //    {
            //       UsesId = 1,
            //       PostsId = "Use 1",
            //    },
            //    new UsesOfFood
            //    {
            //        UsesId = 2,
            //        PostsId = "Use 2",
            //    },
            //    new UsesOfFood
            //    {
            //        UsesId = 3,
            //        PostsId = "Use 3",
            //    },
            //    new UsesOfFood
            //    {
            //        UsesId = 4,
            //        PostsId = "Use 4",
            //    },
            //    new UsesOfFood
            //    {
            //        UsesId = 5,
            //        PostsId = "Use 5",
            //    },
            //    new UsesOfFood
            //    {
            //        UsesId = 6,
            //        PostsId = "Use 6",
            //    },
            //    new UsesOfFood
            //    {
            //        UsesId = 7,
            //        PostsId = "Use 7",
            //    },
            //    new UsesOfFood
            //    {
            //        UsesId = 8,
            //        PostsId = "Use 8",
            //    },
            //    new UsesOfFood
            //    {,
            //        UsesId = 9,
            //        PostsId = "Use 9",
            //    },
            //    new UsesOfFood
            //    {
            //        UsesId = 10,
            //        PostsId = "Use 10",
            //    }
            //};
            //for (int i = 0; i < useOfFoods.Count(); i++)
            //{
            //    _reciContext.UsesOfFoods.Add(useOfFoods[i]);
            //}
            //_reciContext.SaveChanges();
        }
    }
}
