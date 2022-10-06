using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class UsesOfFood
    {
        public int Id { get; set; }
        public int UsesId { get; set; }
        public string PostsId { get; set; } = null!;

        public virtual Post? Posts { get; set; }
        public virtual Use? Uses { get; set; }

        public void UseOfFoodMock()
        {
            var useOfFoods = new List<UsesOfFood>()
            {
                new UsesOfFood
                {
                   Id = 1,
                   UsesId = 1,
                   PostsId = "Use 1",
                },
                new UsesOfFood
                {
                    Id = 2,
                    UsesId = 2,
                    PostsId = "Use 2",
                },
                new UsesOfFood
                {
                    Id = 3,
                    UsesId = 3,
                    PostsId = "Use 3",
                },
                new UsesOfFood
                {
                    Id = 4,
                    UsesId = 4,
                    PostsId = "Use 4",
                },
                new UsesOfFood
                {
                    Id = 5,
                    UsesId = 5,
                    PostsId = "Use 5",
                },
                new UsesOfFood
                {
                    Id = 6,
                    UsesId = 6,
                    PostsId = "Use 6",
                },
                new UsesOfFood
                {
                    Id = 7,
                    UsesId = 7,
                    PostsId = "Use 7",
                },
                new UsesOfFood
                {
                    Id = 8,
                    UsesId = 8,
                    PostsId = "Use 8",
                },
                new UsesOfFood
                {
                    Id = 9,
                    UsesId = 9,
                    PostsId = "Use 9",
                },
                new UsesOfFood
                {
                    Id = 10,
                    UsesId = 10,
                    PostsId = "Use 10",
                }
            };

            useOfFoods.AddRange(useOfFoods);
        }
    }
}
