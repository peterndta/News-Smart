using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class Ingredient
    {
        public Ingredient()
        {
            FoodIngredients = new HashSet<FoodIngredient>();
        }

        public string Id { get; set; } = null!;
        public string? Name { get; set; }
        public string? CategoryId { get; set; }

        public virtual Category? Category { get; set; }
        public virtual ICollection<FoodIngredient> FoodIngredients { get; set; }
    }
}
