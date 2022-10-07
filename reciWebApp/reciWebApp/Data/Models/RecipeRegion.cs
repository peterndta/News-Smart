using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class RecipeRegion
    {
        public RecipeRegion()
        {
            Posts = new HashSet<Post>();
        }

        public int Id { get; set; }
        public string? Country { get; set; }
        public string? Region { get; set; }

        public virtual ICollection<Post> Posts { get; set; }

        public void RecipeRegionMock()
        {
            var reciRegions = new List<RecipeRegion>()
            {
                new RecipeRegion
            {
                Id = 1,
                Country = "Viet Nam",
                Region = "Ha Noi",
            },
                new RecipeRegion
            {
                Id = 2,
                Country = "Viet Nam",
                Region = "Sai Gon",
            },
                new RecipeRegion
            {
                Id = 3,
                Country = "Viet Nam",
                Region = "Da Nang",
            },
                new RecipeRegion
            {
                Id = 4,
                Country = "Italia",
                Region = "Europe",
            },
                new RecipeRegion
            {
                Id = 5,
                Country = "Russia",
                Region = "Europe",
            },
                new RecipeRegion
            {
                Id = 6,
                Country = "UK",
                Region = "Europe",
            },
                new RecipeRegion
            {
                Id = 7,
                Country = "Mexico",
                Region = "America",
            },
                new RecipeRegion
            {
                Id = 8,
                Country = "USA",
                Region = "America",
            },
                new RecipeRegion
            {
                Id = 9,
                Country = "Thai Lan",
                Region = "Asia",
            },
                new RecipeRegion
            {
                Id = 10,
                Country = "Japan",
                Region = "Asia",
            },
            };

            reciRegions.AddRange(reciRegions);
        }
    }
}
