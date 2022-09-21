using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class StepsType
    {
        public StepsType()
        {
            Steps = new HashSet<Step>();
        }

        public string Id { get; set; } = null!;
        public string? StepsName { get; set; }

        public virtual ICollection<Step> Steps { get; set; }
    }
}
