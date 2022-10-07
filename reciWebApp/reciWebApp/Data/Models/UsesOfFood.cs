using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class UsesOfFood
    {
        public int Id { get; set; }
        public int UsesId { get; set; }
        public string PostsId { get; set; } = null!;

        public virtual Post? Posts { get; set; }
        public virtual Use? Uses { get; set; }
    }
}
