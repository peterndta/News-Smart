using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class PostReport
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string PostsId { get; set; } = null!;
        public string Reason { get; set; } = null!;
        public int Status { get; set; }

        public virtual Post Posts { get; set; } = null!;
        public virtual User User { get; set; } = null!;
        public virtual Notification? Notification { get; set; }
    }
}
