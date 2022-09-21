using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class CookingMethod
    {
        public CookingMethod()
        {
            Posts = new HashSet<Post>();
        }

        public string Id { get; set; } = null!;
        public string? Method { get; set; }

        public virtual ICollection<Post> Posts { get; set; }
    }
}
