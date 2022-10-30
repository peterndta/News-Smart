using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class Post
    {
        public Post()
        {
            FoodCollections = new HashSet<FoodCollection>();
            PostCategories = new HashSet<PostCategory>();
            PostMeta = new HashSet<PostMetum>();
            PostReports = new HashSet<PostReport>();
            Steps = new HashSet<Step>();
            UserInteracts = new HashSet<UserInteract>();
        }

        public string Id { get; set; } = null!;
        public string Name { get; set; } = null!;
        public DateTime? CreateDate { get; set; }
        public DateTime? UpdateDate { get; set; }
        public int CookingMethodId { get; set; }
        public int RecipeRegionId { get; set; }
        public int UserId { get; set; }
        public int Status { get; set; }
        public string? ImageUrl { get; set; }
        public string? VideoUrl { get; set; }
        public int UsesId { get; set; }
        public string Description { get; set; } = null!;

        public virtual CookingMethod CookingMethod { get; set; } = null!;
        public virtual RecipeRegion RecipeRegion { get; set; } = null!;
        public virtual User User { get; set; } = null!;
        public virtual Use Uses { get; set; } = null!;
        public virtual ICollection<FoodCollection> FoodCollections { get; set; }
        public virtual ICollection<PostCategory> PostCategories { get; set; }
        public virtual ICollection<PostMetum> PostMeta { get; set; }
        public virtual ICollection<PostReport> PostReports { get; set; }
        public virtual ICollection<Step> Steps { get; set; }
        public virtual ICollection<UserInteract> UserInteracts { get; set; }
    }
}
