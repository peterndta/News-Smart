using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class User
    {
        public User()
        {
            PostReports = new HashSet<PostReport>();
            UserInteracts = new HashSet<UserInteract>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;
        public string Email { get; set; } = null!;
        public DateTime? BanTime { get; set; }
        public string Role { get; set; } = null!;
        public string? ImageUrl { get; set; }

        public virtual ICollection<PostReport> PostReports { get; set; }
        public virtual ICollection<UserInteract> UserInteracts { get; set; }
    }
}
