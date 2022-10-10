using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class PostMetum
    {
        public int Id { get; set; }
        public string PostId { get; set; } = null!;
        public string Reason { get; set; } = null!;

        public virtual Post Post { get; set; } = null!;
    }
}
