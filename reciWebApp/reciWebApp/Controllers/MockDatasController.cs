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
            var categories = new List<Category>()
            {
                new Category
                {
                    Type = "Meat",
                },
                new Category
                {
                    Type = "Vegetables",
                }, new Category
                {
                    Type = "Seafood",
                },
                new Category
                {
                    Type = "Fruit",
                },
                new Category
                {
                    Type = "Soups",
                },
                new Category
                {
                    Type = "Diary",
                },
                new Category
                {
                    Type = "Bread",
                },
                new Category
                {
                    Type = "Pasta",
                },
                new Category
                {
                    Type = "Nut",
                },
                new Category
                {
                    Type = "Jam",
                },
                new Category
                {
                    Type = "Canned food",
                },
                new Category
                {
                    Type = "Others",
                }
            };
            for (int i = 0; i < categories.Count(); i++)
            {
                _reciContext.Categories.Add(categories[i]);
            }
            var cookingMethods = new List<CookingMethod>()
            {
                new CookingMethod
                {
                    Method = "Broiling",
                },
                new CookingMethod
                {
                    Method = "Braising",
                },
                new CookingMethod
                {
                    Method = "Baking",
                },
                new CookingMethod
                {
                    Method = "Poaching",
                },
                new CookingMethod
                {
                    Method = "Sauteeing",
                },
                new CookingMethod
                {
                    Method = "Roasting",
                },
                new CookingMethod
                {
                    Method = "Searing",
                },
                new CookingMethod
                {
                    Method = "Grilling",
                },
                new CookingMethod
                {
                    Method = "Barbecuing",
                },
                new CookingMethod
                {
                    Method = "Frying",
                },
                new CookingMethod
                {
                    Method = "Others",
                }
            };

            for (int i = 0; i < cookingMethods.Count(); i++)
            {
                _reciContext.CookingMethods.Add(cookingMethods[i]);
            }
            var reciRegions = new List<RecipeRegion>()
            {
                new RecipeRegion
            {
                Continents = "Asia",
            },
                new RecipeRegion
            {
                Continents = "Africa",
            },
                new RecipeRegion
            {
                Continents= "Antarctica",
            },
                new RecipeRegion
            {
                Continents = "Australia",
            },
                new RecipeRegion
            {
                Continents = "Europe",
            },
                new RecipeRegion
            {
                Continents = "North America",
            },
                new RecipeRegion
            {
                Continents = "South America",
            }
            };
            for (int i = 0; i < reciRegions.Count(); i++)
            {
                _reciContext.RecipeRegions.Add(reciRegions[i]);
            }

            var use = new List<Use>()
            {
                new Use
                {
                    UsesOfFood = "Improving memory and concentration",
                },
                new Use
                {
                    UsesOfFood = "Improving your immune system",
                },
                new Use
                {
                    UsesOfFood = "Increasing energy",
                },
                new Use
                {
                    UsesOfFood = "Beautiful skin",
                },
                new Use
                {
                    UsesOfFood = "Increasing productivity",
                },
                new Use
                {
                    UsesOfFood = "More nutrients for the body",
                },
                new Use
                {
                    UsesOfFood = "Hadle stress better",
                },
                new Use
                {
                    UsesOfFood = "Better rest and sleep",
                },
                new Use
                {
                    UsesOfFood = "Digestive and cellular health",
                },
                new Use
                {
                    UsesOfFood = "Weight loss",
                },
                new Use
                {
                    UsesOfFood = "Others",
                }
            };
            for (int i = 0; i < use.Count(); i++)
            {
                _reciContext.Uses.Add(use[i]);
            }

            //var posts = new List<Post>()
            //{
            //    new Post
            //{
            //    Id = "b1",
            //    Name = "Delicious Egg Salad for Sandwiches",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 82,
            //    RecipeRegionId = 72,
            //    UserId = 1,
            //    Status = 1,
            //    ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    Description = "This is a wonderful-tasting egg salad sandwich that you will definitely devour. It's really good on rye.",
            //    UsesId = 43,
            //},
            //    new Post
            //{
            //    Id = "b2",
            //    Name = "Old Fashioned Potato Salad",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 83,
            //    RecipeRegionId = 73,
            //    UserId = 2,
            //    Status = 2,
            //    ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    Description = "This is potato salad the old-fashioned way, with eggs, celery and relish. It's really good to serve with chili.",
            //    UsesId = 44,
            //},
            //    new Post
            //{

            //    Id = "b3",
            //    Name = "Pasta Salad",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 84,
            //    RecipeRegionId = 74,
            //    UserId = 3,
            //    Status = 3,
            //    ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    Description = "A homemade Italian pasta salad dressing takes this simple pasta salad loaded with veggies, cheese, pepperoni, and olives to a whole new level! Serve it right away or make it ahead for packed lunches, picnics, or summer barbecues.",
            //    UsesId = 45,
            //    },
            //    new Post
            //{

            //    Id = "b4",
            //    Name = "Homemade Corn Dogs",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 85,
            //    RecipeRegionId = 75,
            //    UserId = 4,
            //    Status = 4,
            //    ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    Description = "My son loves corn dogs, but I despise all the additives in store-bought. This recipe makes us both happy!",
            //    UsesId = 46,
            //},
            //    new Post
            //{

            //    Id = "b5",
            //    Name = "Day-After-Thanksgiving Turkey Carcass Soup",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 86,
            //    RecipeRegionId = 76,
            //    UserId = 5,
            //    Status = 5,
            //    ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    Description = "This leftover turkey soup is an easy and delicious meal that puts your turkey carcass to good use. Save the carcass from your Thanksgiving or Christmas dinner — and some stuffing too! — and make this tasty soup for lunch or a light dinner the next day. I usually make cornbread muffins to serve with it.",
            //    UsesId = 47,
            //},
            //    new Post
            //{

            //    Id = "b6",
            //    Name = "Slow Cooker Italian Beef for Sandwiches",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 87,
            //    RecipeRegionId = 77,
            //    UserId = 6,
            //    Status = 6,
            //    ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    Description = "This Italian beef recipe makes a sandwich similar to one I used to get at a local restaurant when I lived in a suburb of Chicago. My all-time favorite! Serve on crusty rolls with roasted sweet or hot peppers, if desired.",
            //    UsesId = 48,
            //},
            //    new Post
            //{

            //    Id = "b7",
            //    Name = "Mom's Zucchini Bread",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 88,
            //    RecipeRegionId = 78,
            //    UserId = 7,
            //    Status = 7,
            //    ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    Description = "This zucchini bread is really, really good and moist — my kids eat it as quickly as I can make it! This recipe makes two loaves but it freezes well and will keep in the refrigerator for weeks.",
            //    UsesId = 49,
            //},
            //    new Post
            //{

            //    Id = "b8",
            //    Name = "Lemon Chicken Orzo Soup",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 89,
            //    RecipeRegionId = 73,
            //    UserId = 8,
            //    Status = 8,
            //    ImageUrl = "https://st.depositphotos.com/1257064/2519/v/600/depositphotos_25195223-stock-illustration-pea-soup.jpg",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    Description = "This lemon chicken orzo soup is inspired by Panera Bread's version. It is so flavorful with tender pieces of chicken in a lemony broth with orzo pasta, carrots, onions, celery, and baby spinach. This has quickly become one of my family's very favorite soup recipes.",
            //    UsesId = 50,
            //},
            //    new Post
            //{
            //    Id = "b9",
            //    Name = "Bahama Mama",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 90,
            //    RecipeRegionId = 77,
            //    UserId = 9,
            //    Status = 9,
            //    ImageUrl = "https://recipes.timesofindia.com/thumb/61589069.cms?width=1200&height=900",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    Description = "A delicious tropical adult drink!",
            //    UsesId = 51,
            //},
            //    new Post
            //{

            //    Id = "b10",
            //    Name = "Mai Tai",
            //    CreateDate = new DateTime (2022, 09, 27),
            //    UpdateDate = new DateTime (2022, 09, 28),
            //    CookingMethodId = 91,
            //    RecipeRegionId = 73,
            //    UserId = 10,
            //    Status = 10,
            //    ImageUrl = "https://recipes.timesofindia.com/thumb/61589069.cms?width=1200&height=900",
            //    VideoUrl = "https://www.youtube.com/watch?v=rxgfxWwRVos",
            //    Description = "This Mai Tai is made with two flavors of rum mixed with pineapple juice and orange juice to make a yummy, fruity drink.",
            //    UsesId = 52,
            //},
            //};
            //for (int i = 0; i < posts.Count(); i++)
            //{
            //    _reciContext.Posts.Add(posts[i]);
            //}

            var step = new List<Step>()
            {
                new Step
                {
                    PostsId= "b1",
                    Ingredient=
                    "8 eggs, ½ cup mayonnaise, 1 teaspoon prepared yellow mustard, ¼ cup chopped green onion, salt and pepper to taste, ¼ teaspoon paprika",
                    Processing = "Place egg in a saucepan and cover with cold water. Bring water to a boil and immediately remove from heat",
                    Cooking = "Cover and let eggs stand in hot water for 10 to 12 minutes. Remove from hot water, cool, peel and chop",
                    Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
                    ProcessingTime = 30,
                    CookingTime= 30,
                    PreparingTime = 30,
                    Serving = 2,
                },
                new Step
                {
                    PostsId= "b2",
                    Ingredient=
                    "8 eggs, ½ cup mayonnaise, 1 teaspoon prepared yellow mustard, ¼ cup chopped green onion, salt and pepper to taste, ¼ teaspoon paprika",
                    Processing = "Place the chopped eggs in a bowl, and stir in the mayonnaise, mustard and green onion",
                    Cooking = " Season with salt, pepper and paprika. Stir and serve on your favorite bread or crackers",
                    Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
                    ProcessingTime = 30,
                    CookingTime= 30,
                    PreparingTime = 30,
                    Serving = 2,
                },
                new Step
                {
                    PostsId= "b3",
                    Ingredient=
                    "5 potatoes, 3 eggs, 1 cup chopped celery, ½ cup chopped onion, ½ cup sweet pickle relish, ¼ cup mayonnaise, 1 tablespoon prepared mustard, ¼ teaspoon garlic salt, ¼ teaspoon celery salt, ground black pepper to taste",
                    Processing = "Bring a large pot of salted water to a boil",
                    Cooking = "Add potatoes and cook until tender but still firm, about 15 minutes. Drain, cool, peel and chop",
                    Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
                    ProcessingTime = 10,
                    CookingTime= 10,
                    PreparingTime = 40,
                    Serving = 3,
                },
                new Step
                {
                    PostsId= "b4",
                    Ingredient=
                    "5 potatoes, 3 eggs, 1 cup chopped celery, ½ cup chopped onion, ½ cup sweet pickle relish, ¼ cup mayonnaise, 1 tablespoon prepared mustard, ¼ teaspoon garlic salt, ¼ teaspoon celery salt, ground black pepper to taste",
                    Processing = "While potatoes cook, place eggs in a saucepan and cover with cold water",
                    Cooking = "Bring water to a boil; cover, remove from heat, and let eggs stand in hot water for 10 to 12 minutes. Remove from hot water, cool, peel and chop",
                    Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
                    ProcessingTime = 10,
                    CookingTime= 10,
                    PreparingTime = 40,
                    Serving = 3,
                },
                new Step
                {
                    PostsId= "b5",
                    Ingredient=
                    "1 (8 ounce) package uncooked tri-color rotini pasta, 6 ounces pepperoni sausage, diced, 6 ounces provolone cheese, cubed, 1 medium red onion, very thinly sliced and cut into 1-inch pieces, 1 small cucumber, thinly sliced, ¾ cup chopped green bell pepper, ¾ cup chopped red bell pepper, 1 (6 ounce) can pitted black olives, drained, ¼ cup minced fresh parsley, ¼ cup grated Parmesan cheese",
                    Processing = "Bring a large pot of lightly salted water to a boil",
                    Cooking = "Add rotini and cook until tender yet firm to the bite, 8 to 10 minutes. Drain, rinse with cold water, and drain again",
                    Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
                    ProcessingTime = 20,
                    CookingTime= 10,
                    PreparingTime = 40,
                    Serving = 2,
                },
                new Step
                {
                    PostsId= "b6",
                    Ingredient=
                    "5 potatoes, 3 eggs, 1 cup chopped celery, ½ cup chopped onion, ½ cup sweet pickle relish, ¼ cup mayonnaise, 1 tablespoon prepared mustard, ¼ teaspoon garlic salt, ¼ teaspoon celery salt, ground black pepper to taste",
                    Processing = "Transfer drained, cooked pasta to a large bowl",
                    Cooking = "Add pepperoni, provolone cheese, red onion, cucumber, bell peppers, olives, parsley, and Parmesan cheese",
                    Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
                    ProcessingTime = 20,
                    CookingTime= 10,
                    PreparingTime = 40,
                    Serving = 2,
                },
                new Step
                {
                    PostsId= "b7",
                    Ingredient=
                    "1 cup yellow cornmeal, 1 cup all-purpose flour, ¼ cup white sugar, 4 teaspoons baking powder, ¼ teaspoon salt, ⅛ teaspoon ground black pepper, 1 cup whole milk, 1 large egg, 16 large hot dogs, 4 cups vegetable oil for frying, 16 skewers",
                    Processing = "Combine cornmeal, flour, white sugar, baking powder, salt, and pepper in a bowl",
                    Cooking = "stir in milk and egg until batter is smooth. Refrigerate until batter is chilled",
                    Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
                    ProcessingTime = 20,
                    CookingTime= 10,
                    PreparingTime = 40,
                    Serving = 5,
                },
                new Step
                {
                    PostsId= "b8",
                    Ingredient=
                    "1 cup yellow cornmeal, 1 cup all-purpose flour, ¼ cup white sugar, 4 teaspoons baking powder, ¼ teaspoon salt, ⅛ teaspoon ground black pepper, 1 cup whole milk, 1 large egg, 16 large hot dogs, 4 cups vegetable oil for frying, 16 skewers",
                    Processing = "Bring a large pot of water to a boil; cook hot dogs until heated through, about 7 minutes",
                    Cooking = "Let hot dogs rest for 10 minutes and dry hot dogs on a paper towel",
                    Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
                    ProcessingTime = 20,
                    CookingTime= 10,
                    PreparingTime = 40,
                    Serving = 5,
                },
                new Step
                {
                    PostsId= "b9",
                    Ingredient=
                    "1 picked over turkey carcass, 1 ½ cups leftover stuffing, 1 onion, peeled and diced, 2 carrots, peeled and sliced, 2 celery stalks, chopped, 1 tablespoon poultry seasoning, 1 teaspoon ground sage, 2 bay leaves, 2 ½ quarts chicken broth, ½ teaspoon garlic salt, or to taste, ground black pepper, to taste, 2 cups (uncooked) regular long-grain white rice, 1 (16 ounce) package frozen green peas, 1 cup water, or as needed (Optional)",
                    Processing = "Place turkey carcass in a large, deep pot",
                    Cooking = "Add stuffing, onion, carrots, celery, poultry seasoning, sage, and bay leaves. Pour in chicken broth, and add additional water, if needed, to cover. Bring to a boil over medium-high heat",
                    Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
                    ProcessingTime = 20,
                    CookingTime= 10,
                    PreparingTime = 40,
                    Serving = 5,
                },
                new Step
                {
                    PostsId= "b10",
                    Ingredient=
                    "1 picked over turkey carcass, 1 ½ cups leftover stuffing, 1 onion, peeled and diced, 2 carrots, peeled and sliced, 2 celery stalks, chopped, 1 tablespoon poultry seasoning, 1 teaspoon ground sage, 2 bay leaves, 2 ½ quarts chicken broth, ½ teaspoon garlic salt, or to taste, ground black pepper, to taste, 2 cups (uncooked) regular long-grain white rice, 1 (16 ounce) package frozen green peas, 1 cup water, or as needed (Optional)",
                    Processing = "Reduce heat to medium and simmer, skimming off any foam, for about 1 hour",
                    Cooking = "Remove carcass and any bones",
                    Tool = "Spatula, potato pusher, whisk, a large sized saucepan",
                    ProcessingTime = 20,
                    CookingTime= 10,
                    PreparingTime = 40,
                    Serving = 5,
                }
            };
            for (int i = 0; i < step.Count(); i++)
            {
                _reciContext.Steps.Add(step[i]);
            }

            var userInteract = new List<UserInteract>()
            {
                new UserInteract
                {
                    UserId = 1,
                    PostsId = "b1",
                    CreateDate = new DateTime(2022, 10, 10),
                    Bookmark = true,
                    Rating = 5,
                    UpdateDate = new DateTime(2022, 10, 10),
                },
                new UserInteract
                {
                    UserId = 2,
                    PostsId = "b1",
                    CreateDate = new DateTime(2022, 10, 10),
                    Bookmark = true,
                    Rating = 4,
                    UpdateDate = new DateTime(2022, 10, 10),
                },
                new UserInteract
                {
                    UserId = 3,
                    PostsId = "b3",
                    CreateDate = new DateTime(2022, 10, 10),
                    Bookmark = true,
                    Rating = 2,
                    UpdateDate = new DateTime(2022, 10, 10),
                },
                new UserInteract
                {
                    UserId = 4,
                    PostsId = "b4",
                    CreateDate = new DateTime(2022, 10, 10),
                    Bookmark = false,
                    Rating = 4,
                    UpdateDate = new DateTime(2022, 10, 10),
                },
                new UserInteract
                {
                    UserId = 5,
                    PostsId = "b5",
                    CreateDate = new DateTime(2022, 10, 10),
                    Bookmark = true,
                    Rating = 1,
                    UpdateDate = new DateTime(2022, 10, 10),
                },
                new UserInteract
                {
                    UserId = 6,
                    PostsId = "b6",
                    CreateDate = new DateTime(2022, 10, 10),
                    Bookmark = false,
                    Rating = 2,
                    UpdateDate = new DateTime(2022, 10, 10),
                },
                new UserInteract
                {
                    UserId = 7,
                    PostsId = "b7",
                    CreateDate = new DateTime(2022, 10, 10),
                    Bookmark = true,
                    Rating = 3,
                    UpdateDate = new DateTime(2022, 10, 10),
                },
                new UserInteract
                {
                    UserId = 8,
                    PostsId = "b8",
                    CreateDate = new DateTime(2022, 10, 10),
                    Bookmark = false,
                    Rating = 5,
                    UpdateDate = new DateTime(2022, 10, 10),
                },
                new UserInteract
                {
                    UserId = 9,
                    PostsId = "b9",
                    CreateDate = new DateTime(2022, 10, 10),
                    Bookmark = false,
                    Rating = 2,
                    UpdateDate = new DateTime(2022, 10, 10),
                },
                new UserInteract
                {
                    UserId = 10,
                    PostsId = "b10",
                    CreateDate = new DateTime(2022, 10, 10),
                    Bookmark = true,
                    Rating = 5,
                    UpdateDate = new DateTime(2022, 10, 10),
                }
            };
            for (int i = 0; i < userInteract.Count(); i++)
            {
                _reciContext.Add(userInteract[i]);
            }   
            
            _reciContext.SaveChanges();
        }
    }
}
