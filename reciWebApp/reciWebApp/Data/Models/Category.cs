using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class Category
    {
        public Category()
        {
            Ingredients = new HashSet<Ingredient>();
        }

        public string Id { get; set; } = null!;
        public string? Type { get; set; }

        public virtual ICollection<Ingredient> Ingredients { get; set; }
    }
}
