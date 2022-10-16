using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class UserInteract
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string PostsId { get; set; } = null!;
        public bool Bookmark { get; set; }
        public int? Rating { get; set; }

        public virtual Post Posts { get; set; } = null!;
        public virtual User User { get; set; } = null!;
    }
}
