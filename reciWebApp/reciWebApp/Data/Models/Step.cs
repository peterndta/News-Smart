using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class Step
    {
        public string Id { get; set; } = null!;
        public string? Description { get; set; }
        public string? UrlVideo { get; set; }
        public string? UrlImage { get; set; }
        public string? PostsId { get; set; }
        public string? StepsTypeId { get; set; }

        public virtual Post? Posts { get; set; }
        public virtual StepsType? StepsType { get; set; }
    }
}
