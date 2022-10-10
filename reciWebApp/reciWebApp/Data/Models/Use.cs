using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class Use
    {
        public Use()
        {
            Posts = new HashSet<Post>();
        }

        public int Id { get; set; }
        public string UsesOfFood { get; set; } = null!;

        public virtual ICollection<Post> Posts { get; set; }
    }
}
