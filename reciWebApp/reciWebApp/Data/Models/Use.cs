using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class Use
    {
        public Use()
        {
            UsesOfFoods = new HashSet<UsesOfFood>();
        }

        public string Id { get; set; } = null!;
        public string? UsesOfFood { get; set; }

        public virtual ICollection<UsesOfFood> UsesOfFoods { get; set; }
    }
}
