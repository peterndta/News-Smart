using Microsoft.AspNetCore.Mvc;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using System;
using System.Net;

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
            //        Type = "Breakfast",
            //    },
            //    new Category
            //    {
            //        Type = "Launch",
            //    }, new Category
            //    {
            //        Type = "Beverages",
            //    },
            //    new Category
            //    {
            //        Type = "Appetizers",
            //    },
            //    new Category
            //    {
            //        Type = "Soups",
            //    },
            //    new Category
            //    {
            //        Type = "Salads",
            //    },
            //    new Category
            //    {
            //        Type = "Desserts",
            //    },
            //    new Category
            //    {
            //        Type = "Breads",
            //    },
            //    new Category
            //    {
            //        Type = "Main dishes",
            //    },
            //    new Category
            //    {
            //        Type = "Holidays",
            //    }
            //};
            //for (int i = 0; i < categories.Count(); i++)
            //{
            //    _reciContext.Categories.Add(categories[i]);
            //}
            //var cookingMethods = new List<CookingMethod>()
            //{
            //    new CookingMethod
            //    {
            //        Method = "Broiling",
            //    },
            //    new CookingMethod
            //    {
            //        Method = "Braising",
            //    },
            //    new CookingMethod
            //    {
            //        Method = "Baking",
            //    },
            //    new CookingMethod
            //    {
            //        Method = "Poaching",
            //    },
            //    new CookingMethod
            //    {
            //        Method = "Sauteeing",
            //    },
            //    new CookingMethod
            //    {
            //        Method = "Roasting",
            //    },
            //    new CookingMethod
            //    {
            //        Method = "Searing",
            //    },
            //    new CookingMethod
            //    {
            //        Method = "Grilling",
            //    },
            //    new CookingMethod
            //    {
            //        Method = "Barbecuing",
            //    },
            //    new CookingMethod
            //    {
            //        Method = "Frying",
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
            //    Region = "North side",
            //},
            //    new RecipeRegion
            //{
            //    Country = "Viet Nam",
            //    Region = "South side",
            //},
            //    new RecipeRegion
            //{
            //    Country = "Viet Nam",
            //    Region = "West side",
            //},
            //    new RecipeRegion
            //{
            //    Country = "Viet Nam",
            //    Region = "East side",
            //},
            //    new RecipeRegion
            //{
            //    Country = "America",
            //    Region = "North side",
            //},
            //    new RecipeRegion
            //{
            //    Country = "America",
            //    Region = "South side",
            //},
            //    new RecipeRegion
            //{
            //    Country = "America",
            //    Region = "West side",
            //},
            //    new RecipeRegion
            //{
            //    Country = "America",
            //    Region = "East side",
            //},
            //    new RecipeRegion
            //{
            //    Country = "Japan",
            //    Region = "Nort side",
            //},
            //    new RecipeRegion
            //{
            //    Country = "Japan",
            //    Region = "South side",
            //},
            //};
            //for (int i = 0; i < reciRegions.Count(); i++)
            //{
            //    _reciContext.RecipeRegions.Add(reciRegions[i]);
            //}

            //var use = new List<Use>()
            //{
            //    new Use
            //    {
            //        UsesOfFood = "Improving memory and concentration",
            //    },
            //    new Use
            //    {
            //        UsesOfFood = "Improving your immune system",
            //    },
            //    new Use
            //    {
            //        UsesOfFood = "Increasing energy",
            //    },
            //    new Use
            //    {
            //        UsesOfFood = "Beautiful skin",
            //    },
            //    new Use
            //    {
            //        UsesOfFood = "Increasing productivity",
            //    },
            //    new Use
            //    {
            //        UsesOfFood = "More nutrients for the body",
            //    },
            //    new Use
            //    {
            //        UsesOfFood = "Hadle stress better",
            //    },
            //    new Use
            //    {
            //        UsesOfFood = "Better rest and sleep",
            //    },
            //    new Use
            //    {
            //        UsesOfFood = "Digestive and cellular health",
            //    },
            //    new Use
            //    {
            //        UsesOfFood = "Weight loss",
            //    },
            //};
            //for (int i = 0; i < use.Count(); i++)
            //{
            //    _reciContext.Uses.Add(use[i]);
            //}

            //var posts = new List<Post>()
            //{
            //    new Post
            //{
            //    Id = "a1",
            //    Name = "Delicious Egg Salad for Sandwiches",
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
            //    Id = "a2",
            //    Name = "Old Fashioned Potato Salad",
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

            //    Id = "a3",
            //    Name = "Pasta Salad",
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

            //    Id = "a4",
            //    Name = "Homemade Corn Dogs",
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

            //    Id = "a5",
            //    Name = "Day-After-Thanksgiving Turkey Carcass Soup",
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

            //    Id = "a6",
            //    Name = "Slow Cooker Italian Beef for Sandwiches",
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

            //    Id = "a7",
            //    Name = "Slow Cooker Italian Beef for Sandwiches",
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

            //    Id = "a8",
            //    Name = "Lemon Chicken Orzo Soup",
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
            //    Id = "a9",
            //    Name = "Bahama Mama",
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

            //    Id = "a10",
            //    Name = "Mai Tai",
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
            //       PostsId = "001",
            //    },
            //    new UsesOfFood
            //    {
            //        UsesId = 2,
            //        PostsId = "002",
            //    },
            //    new UsesOfFood
            //    {
            //        UsesId = 3,
            //        PostsId = "003",
            //    },
            //    new UsesOfFood
            //    {
            //        UsesId = 4,
            //        PostsId = "004",
            //    },
            //    new UsesOfFood
            //    {
            //        UsesId = 5,
            //        PostsId = "005",
            //    },
            //    new UsesOfFood
            //    {
            //        UsesId = 6,
            //        PostsId = "006",
            //    },
            //    new UsesOfFood
            //    {
            //        UsesId = 7,
            //        PostsId = "007",
            //    },
            //    new UsesOfFood
            //    {
            //        UsesId = 8,
            //        PostsId = "008",
            //    },
            //    new UsesOfFood
            //    {
            //        UsesId = 9,
            //        PostsId = "009",
            //    },
            //    new UsesOfFood
            //    {
            //        UsesId = 10,
            //        PostsId = "010",
            //    }
            //};
            //for (int i = 0; i < useOfFoods.Count(); i++)
            //{
            //    _reciContext.UsesOfFoods.Add(useOfFoods[i]);
            //}
            //var step = new List<Step>()
            //{
            //    new Step
            //    {
            //        Description = "This is the first step of dish",
            //        PostsId= "001",
            //        Ingredient=
            //        "8 eggs, ½ cup mayonnaise, 1 teaspoon prepared yellow mustard, ¼ cup chopped green onion, salt and pepper to taste, ¼ teaspoon paprika",
            //        Processing = "Place egg in a saucepan and cover with cold water. Bring water to a boil and immediately remove from heat",
            //        Cooking = "Cover and let eggs stand in hot water for 10 to 12 minutes. Remove from hot water, cool, peel and chop",
            //        Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
            //        ProcessingTime = 30,
            //        CookingTime= 30,
            //        PreparingTime = 30,
            //        Serving = 2,
            //    },
            //    new Step
            //    {
            //        Description = "This is the second step of dish",
            //        PostsId= "001",
            //        Ingredient=
            //        "8 eggs, ½ cup mayonnaise, 1 teaspoon prepared yellow mustard, ¼ cup chopped green onion, salt and pepper to taste, ¼ teaspoon paprika",
            //        Processing = "Place the chopped eggs in a bowl, and stir in the mayonnaise, mustard and green onion",
            //        Cooking = " Season with salt, pepper and paprika. Stir and serve on your favorite bread or crackers",
            //        Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
            //        ProcessingTime = 30,
            //        CookingTime= 30,
            //        PreparingTime = 30,
            //        Serving = 2,
            //    },
            //    new Step
            //    {
            //        Description = "This is the first step of dish",
            //        PostsId= "002",
            //        Ingredient=
            //        "5 potatoes, 3 eggs, 1 cup chopped celery, ½ cup chopped onion, ½ cup sweet pickle relish, ¼ cup mayonnaise, 1 tablespoon prepared mustard, ¼ teaspoon garlic salt, ¼ teaspoon celery salt, ground black pepper to taste",
            //        Processing = "Bring a large pot of salted water to a boil",
            //        Cooking = "Add potatoes and cook until tender but still firm, about 15 minutes. Drain, cool, peel and chop",
            //        Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
            //        ProcessingTime = 10,
            //        CookingTime= 10,
            //        PreparingTime = 40,
            //        Serving = 3,
            //    },
            //    new Step
            //    {
            //        Description = "This is the second step of dish",
            //        PostsId= "002",
            //        Ingredient=
            //        "5 potatoes, 3 eggs, 1 cup chopped celery, ½ cup chopped onion, ½ cup sweet pickle relish, ¼ cup mayonnaise, 1 tablespoon prepared mustard, ¼ teaspoon garlic salt, ¼ teaspoon celery salt, ground black pepper to taste",
            //        Processing = "While potatoes cook, place eggs in a saucepan and cover with cold water",
            //        Cooking = "Bring water to a boil; cover, remove from heat, and let eggs stand in hot water for 10 to 12 minutes. Remove from hot water, cool, peel and chop",
            //        Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
            //        ProcessingTime = 10,
            //        CookingTime= 10,
            //        PreparingTime = 40,
            //        Serving = 3,
            //    },
            //    new Step
            //    {
            //        Description = "This is the first step of dish",
            //        PostsId= "003",
            //        Ingredient=
            //        "1 (8 ounce) package uncooked tri-color rotini pasta, 6 ounces pepperoni sausage, diced, 6 ounces provolone cheese, cubed, 1 medium red onion, very thinly sliced and cut into 1-inch pieces, 1 small cucumber, thinly sliced, ¾ cup chopped green bell pepper, ¾ cup chopped red bell pepper, 1 (6 ounce) can pitted black olives, drained, ¼ cup minced fresh parsley, ¼ cup grated Parmesan cheese",
            //        Processing = "Bring a large pot of lightly salted water to a boil",
            //        Cooking = "Add rotini and cook until tender yet firm to the bite, 8 to 10 minutes. Drain, rinse with cold water, and drain again",
            //        Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
            //        ProcessingTime = 20,
            //        CookingTime= 10,
            //        PreparingTime = 40,
            //        Serving = 2,
            //    },
            //    new Step
            //    {
            //        Description = "This is the second step of dish",
            //        PostsId= "003",
            //        Ingredient=
            //        "5 potatoes, 3 eggs, 1 cup chopped celery, ½ cup chopped onion, ½ cup sweet pickle relish, ¼ cup mayonnaise, 1 tablespoon prepared mustard, ¼ teaspoon garlic salt, ¼ teaspoon celery salt, ground black pepper to taste",
            //        Processing = "Transfer drained, cooked pasta to a large bowl",
            //        Cooking = "Add pepperoni, provolone cheese, red onion, cucumber, bell peppers, olives, parsley, and Parmesan cheese",
            //        Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
            //        ProcessingTime = 20,
            //        CookingTime= 10,
            //        PreparingTime = 40,
            //        Serving = 2,
            //    },
            //    new Step
            //    {
            //        Description = "This is the first step of dish",
            //        PostsId= "004",
            //        Ingredient=
            //        "1 cup yellow cornmeal, 1 cup all-purpose flour, ¼ cup white sugar, 4 teaspoons baking powder, ¼ teaspoon salt, ⅛ teaspoon ground black pepper, 1 cup whole milk, 1 large egg, 16 large hot dogs, 4 cups vegetable oil for frying, 16 skewers",
            //        Processing = "Combine cornmeal, flour, white sugar, baking powder, salt, and pepper in a bowl",
            //        Cooking = "stir in milk and egg until batter is smooth. Refrigerate until batter is chilled",
            //        Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
            //        ProcessingTime = 20,
            //        CookingTime= 10,
            //        PreparingTime = 40,
            //        Serving = 5,
            //    },
            //    new Step
            //    {
            //        Description = "This is the second step of dish",
            //        PostsId= "004",
            //        Ingredient=
            //        "1 cup yellow cornmeal, 1 cup all-purpose flour, ¼ cup white sugar, 4 teaspoons baking powder, ¼ teaspoon salt, ⅛ teaspoon ground black pepper, 1 cup whole milk, 1 large egg, 16 large hot dogs, 4 cups vegetable oil for frying, 16 skewers",
            //        Processing = "Bring a large pot of water to a boil; cook hot dogs until heated through, about 7 minutes",
            //        Cooking = "Let hot dogs rest for 10 minutes and dry hot dogs on a paper towel",
            //        Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
            //        ProcessingTime = 20,
            //        CookingTime= 10,
            //        PreparingTime = 40,
            //        Serving = 5,
            //    },
            //    new Step
            //    {
            //        Description = "This is the first step of dish",
            //        PostsId= "005",
            //        Ingredient=
            //        "1 picked over turkey carcass, 1 ½ cups leftover stuffing, 1 onion, peeled and diced, 2 carrots, peeled and sliced, 2 celery stalks, chopped, 1 tablespoon poultry seasoning, 1 teaspoon ground sage, 2 bay leaves, 2 ½ quarts chicken broth, ½ teaspoon garlic salt, or to taste, ground black pepper, to taste, 2 cups (uncooked) regular long-grain white rice, 1 (16 ounce) package frozen green peas, 1 cup water, or as needed (Optional)",
            //        Processing = "Place turkey carcass in a large, deep pot",
            //        Cooking = "Add stuffing, onion, carrots, celery, poultry seasoning, sage, and bay leaves. Pour in chicken broth, and add additional water, if needed, to cover. Bring to a boil over medium-high heat",
            //        Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
            //        ProcessingTime = 20,
            //        CookingTime= 10,
            //        PreparingTime = 40,
            //        Serving = 5,
            //    },
            //    new Step
            //    {
            //        Description = "This is the second step of dish",
            //        PostsId= "005",
            //        Ingredient=
            //        "1 picked over turkey carcass, 1 ½ cups leftover stuffing, 1 onion, peeled and diced, 2 carrots, peeled and sliced, 2 celery stalks, chopped, 1 tablespoon poultry seasoning, 1 teaspoon ground sage, 2 bay leaves, 2 ½ quarts chicken broth, ½ teaspoon garlic salt, or to taste, ground black pepper, to taste, 2 cups (uncooked) regular long-grain white rice, 1 (16 ounce) package frozen green peas, 1 cup water, or as needed (Optional)",
            //        Processing = "Reduce heat to medium and simmer, skimming off any foam, for about 1 hour",
            //        Cooking = "Remove carcass and any bones",
            //        Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
            //        ProcessingTime = 20,
            //        CookingTime= 10,
            //        PreparingTime = 40,
            //        Serving = 5,
            //    }
            //};
            //for (int i = 0; i < step.Count(); i++)
            //{
            //    _reciContext.Steps.Add(step[i]);
            //}
            //_reciContext.SaveChanges();
        }
    }
}
