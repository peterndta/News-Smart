using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class Category
    {
        public Category()
        {
            Posts = new HashSet<Post>();
        }

        public int Id { get; set; }
        public string? Type { get; set; }

        public virtual ICollection<Post> Posts { get; set; }
    }
}
