using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class CookingMethod
    {
        public int Id { get; set; }
        public string Method { get; set; } = null!;
    }
}
