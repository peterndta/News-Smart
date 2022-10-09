using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class PostCategory
    {
        public int Id { get; set; }
        public string PostId { get; set; } = null!;
        public int CategoryId { get; set; }

        public virtual Category Category { get; set; } = null!;
        public virtual Post Post { get; set; } = null!;
    }
}
