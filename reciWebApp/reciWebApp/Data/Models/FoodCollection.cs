using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class FoodCollection
    {
        public string Id { get; set; } = null!;
        public string? PostsId { get; set; }
        public string? CollectionId { get; set; }

        public virtual Collection? Collection { get; set; }
        public virtual Post? Posts { get; set; }
    }
}
