using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class User
    {
        public User()
        {
            Posts = new HashSet<Post>();
            UserInteracts = new HashSet<UserInteract>();
        }

        public string Id { get; set; } = null!;
        public string? Name { get; set; }
        public string? Email { get; set; }
        public DateTime? BanTime { get; set; }

        public virtual ICollection<Post> Posts { get; set; }
        public virtual ICollection<UserInteract> UserInteracts { get; set; }
    }
}
