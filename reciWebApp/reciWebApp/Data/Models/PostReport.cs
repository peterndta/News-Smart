using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class PostReport
    {
        public string Id { get; set; } = null!;
        public string? UserId { get; set; }
        public string? PostsId { get; set; }
        public string? Reason { get; set; }
        public int? Status { get; set; }

        public virtual Post? Posts { get; set; }
    }
}
