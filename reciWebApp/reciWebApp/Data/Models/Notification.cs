using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class Notification
    {
        public int Id { get; set; }
        public int PostReportId { get; set; }
        public string? Message { get; set; }
        public DateTime? CreateDate { get; set; }
        public bool? HaveSeen { get; set; }

        public virtual PostReport PostReport { get; set; } = null!;
    }
}
