using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class Step
    {
        public int Id { get; set; }
        public string PostsId { get; set; } = null!;
        public string Ingredient { get; set; } = null!;
        public string Processing { get; set; } = null!;
        public string Cooking { get; set; } = null!;
        public string? Tool { get; set; }
        public int? ProcessingTime { get; set; }
        public int? CookingTime { get; set; }
        public int? PreparingTime { get; set; }
        public int? Serving { get; set; }

        public virtual Post Posts { get; set; } = null!;
    }
}
