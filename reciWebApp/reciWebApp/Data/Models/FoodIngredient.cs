using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class FoodIngredient
    {
        public string Id { get; set; } = null!;
        public string? PostsId { get; set; }
        public string? IngredientId { get; set; }
        public double? Mass { get; set; }

        public virtual Ingredient? Ingredient { get; set; }
        public virtual Post? Posts { get; set; }
    }
}
