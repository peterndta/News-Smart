using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class Post
    {
        public Post()
        {
            FoodCollections = new HashSet<FoodCollection>();
            FoodIngredients = new HashSet<FoodIngredient>();
            PostReports = new HashSet<PostReport>();
            Steps = new HashSet<Step>();
            UserInteracts = new HashSet<UserInteract>();
            UsesOfFoods = new HashSet<UsesOfFood>();
        }

        public string Id { get; set; } = null!;
        public string? Name { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string? CookingMethodId { get; set; }
        public string? RecipeTypeId { get; set; }
        public string? UserId { get; set; }
        public int? Status { get; set; }
        public string? UsesId { get; set; }

        public virtual CookingMethod? CookingMethod { get; set; }
        public virtual RecipeType? RecipeType { get; set; }
        public virtual User? Uses { get; set; }
        public virtual ICollection<FoodCollection> FoodCollections { get; set; }
        public virtual ICollection<FoodIngredient> FoodIngredients { get; set; }
        public virtual ICollection<PostReport> PostReports { get; set; }
        public virtual ICollection<Step> Steps { get; set; }
        public virtual ICollection<UserInteract> UserInteracts { get; set; }
        public virtual ICollection<UsesOfFood> UsesOfFoods { get; set; }
    }
}
