using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class Collection
    {
        public Collection()
        {
            FoodCollections = new HashSet<FoodCollection>();
        }

        public string Id { get; set; } = null!;
        public string? CollectionName { get; set; }

        public virtual ICollection<FoodCollection> FoodCollections { get; set; }
    }
}
