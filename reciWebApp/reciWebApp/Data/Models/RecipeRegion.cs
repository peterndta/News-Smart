using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class RecipeRegion
    {
        public int Id { get; set; }
        public string Continents { get; set; } = null!;
    }
}
