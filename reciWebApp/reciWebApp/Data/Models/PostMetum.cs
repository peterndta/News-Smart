using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class PostMetum
    {
        public int Id { get; set; }
        public string? PostId { get; set; }
        public string? Reason { get; set; }

        public virtual Post? Post { get; set; }
    }
}
