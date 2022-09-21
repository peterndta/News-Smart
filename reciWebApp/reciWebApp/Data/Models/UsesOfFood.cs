using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class UsesOfFood
    {
        public string Id { get; set; } = null!;
        public string? UsesId { get; set; }
        public string? PostsId { get; set; }

        public virtual Post? Posts { get; set; }
        public virtual Use? Uses { get; set; }
    }
}
