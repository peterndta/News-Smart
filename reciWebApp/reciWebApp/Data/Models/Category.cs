using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class Category
    {
        public Category()
        {
            PostCategories = new HashSet<PostCategory>();
        }

        public int Id { get; set; }
        public string Type { get; set; } = null!;

        public virtual ICollection<PostCategory> PostCategories { get; set; }
    }
}
