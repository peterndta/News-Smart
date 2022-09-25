using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class FoodCollection
    {
        public int Id { get; set; }
        public string? PostsId { get; set; }
        public int? CollectionId { get; set; }

        public virtual Collection? Collection { get; set; }
        public virtual Post? Posts { get; set; }
    }
}
