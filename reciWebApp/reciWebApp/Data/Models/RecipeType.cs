using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class RecipeType
    {
        public RecipeType()
        {
            Posts = new HashSet<Post>();
        }

        public string Id { get; set; } = null!;
        public string? Country { get; set; }
        public string? Region { get; set; }

        public virtual ICollection<Post> Posts { get; set; }
    }
}
