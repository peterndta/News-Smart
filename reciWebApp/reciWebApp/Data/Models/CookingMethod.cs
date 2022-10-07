using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class CookingMethod
    {
        public CookingMethod()
        {
            Posts = new HashSet<Post>();
        }

        public int Id { get; set; }
        public string? Method { get; set; }

        public virtual ICollection<Post> Posts { get; set; }

        public void CookingMethodMock()
        {
            var cookingMethods = new List<CookingMethod>()
            {
                new CookingMethod
                {
                    Id = 1,
                    Method = "Method 1",
                },
                new CookingMethod
                {
                    Id = 2,
                    Method = "Method 2",
                },
                new CookingMethod
                {
                    Id = 3,
                    Method = "Method 3",
                },
                new CookingMethod
                {
                    Id = 4,
                    Method = "Method 4",
                },
                new CookingMethod
                {
                    Id = 5,
                    Method = "Method 5",
                },
                new CookingMethod
                {
                    Id = 6,
                    Method = "Method 6",
                },
                new CookingMethod
                {
                    Id = 7,
                    Method = "Method 7",
                },
                new CookingMethod
                {
                    Id = 8,
                    Method = "Method 8",
                },
                new CookingMethod
                {
                    Id = 9,
                    Method = "Method 9",
                },
                new CookingMethod
                {
                    Id = 10,
                    Method = "Method 10",
                }
            };

            cookingMethods.AddRange(cookingMethods);
        }
    }
}
