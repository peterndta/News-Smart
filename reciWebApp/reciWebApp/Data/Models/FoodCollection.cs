using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class FoodCollection
    {
        public int Id { get; set; }
        public string PostsId { get; set; } = null!;
        public string SubCollectionId { get; set; } = null!;

        public virtual Post Posts { get; set; } = null!;
        public virtual SubCollection SubCollection { get; set; } = null!;
    }
}
