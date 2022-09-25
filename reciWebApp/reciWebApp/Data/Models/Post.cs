using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class Post
    {
        public Post()
        {
            FoodCollections = new HashSet<FoodCollection>();
            PostMeta = new HashSet<PostMetum>();
            PostReports = new HashSet<PostReport>();
            Steps = new HashSet<Step>();
            UserInteracts = new HashSet<UserInteract>();
            UsesOfFoods = new HashSet<UsesOfFood>();
        }

        public string Id { get; set; } = null!;
        public string? Name { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? UpdateDate { get; set; }
        public int? CookingMethodId { get; set; }
        public int? RecipeTypeId { get; set; }
        public int? UserId { get; set; }
        public int? Status { get; set; }
        public string? ImageUrl { get; set; }
        public string? VideoUrl { get; set; }
        public int? CategoryId { get; set; }

        public virtual Category? Category { get; set; }
        public virtual CookingMethod? CookingMethod { get; set; }
        public virtual RecipeRegion? RecipeType { get; set; }
        public virtual User? User { get; set; }
        public virtual ICollection<FoodCollection> FoodCollections { get; set; }
        public virtual ICollection<PostMetum> PostMeta { get; set; }
        public virtual ICollection<PostReport> PostReports { get; set; }
        public virtual ICollection<Step> Steps { get; set; }
        public virtual ICollection<UserInteract> UserInteracts { get; set; }
        public virtual ICollection<UsesOfFood> UsesOfFoods { get; set; }
    }
}
