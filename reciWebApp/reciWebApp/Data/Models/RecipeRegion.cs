using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class RecipeRegion
    {
        public RecipeRegion()
        {
            Posts = new HashSet<Post>();
        }

        public int Id { get; set; }
        public string? Country { get; set; }
        public string? Region { get; set; }

        public virtual ICollection<Post> Posts { get; set; }
    }
}
