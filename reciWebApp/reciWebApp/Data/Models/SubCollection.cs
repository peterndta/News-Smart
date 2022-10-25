using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class SubCollection
    {
        public SubCollection()
        {
            FoodCollections = new HashSet<FoodCollection>();
        }

        public string Id { get; set; } = null!;
        public int? CollectionId { get; set; }

        public virtual Collection? Collection { get; set; }
        public virtual ICollection<FoodCollection> FoodCollections { get; set; }
    }
}
