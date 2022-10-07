using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class Category
    {
        public Category()
        {
            Posts = new HashSet<Post>();
        }

        public int Id { get; set; }
        public string? Type { get; set; }

        public virtual ICollection<Post> Posts { get; set; }

        public void CategoryMock()
        {
            var categories = new List<Category>()
            {
                new Category
                {
                    Id = 1,
                    Type = "Category 1",
                },
                new Category
                {
                    Id = 2,
                    Type = "Category 2",
                }, new Category
                {
                    Id = 3,
                    Type = "Category 3",
                },
                new Category
                {
                    Id = 4,
                    Type = "Category 4",
                },
                new Category
                {
                    Id = 5,
                    Type = "Category 5",
                },
                new Category
                {
                    Id = 6,
                    Type = "Category 6",
                },
                new Category
                {
                    Id = 7,
                    Type = "Category 7",
                },
                new Category
                {
                    Id = 8,
                    Type = "Category 8",
                },
                new Category
                {
                    Id = 9,
                    Type = "Category 9",
                },
                new Category
                {
                    Id = 10,
                    Type = "Category 10",
                }
            };

            categories.AddRange(categories);
        }
    }
}
