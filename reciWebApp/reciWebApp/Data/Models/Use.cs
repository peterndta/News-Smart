using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class Use
    {
        public int Id { get; set; }
        public string UsesOfFood { get; set; } = null!;
    }
}
