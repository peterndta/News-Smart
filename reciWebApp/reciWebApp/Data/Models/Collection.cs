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

        public int Id { get; set; }
        public string? CollectionName { get; set; }

        public virtual ICollection<FoodCollection> FoodCollections { get; set; }
    }
}
