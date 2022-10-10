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

        public int Id { get; set; }
        public string Method { get; set; } = null!;

        public virtual ICollection<Post> Posts { get; set; }
    }
}
