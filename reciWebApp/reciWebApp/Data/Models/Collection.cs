using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class Collection
    {
        public Collection()
        {
            SubCollections = new HashSet<SubCollection>();
        }

        public int Id { get; set; }
        public string CollectionName { get; set; } = null!;

        public virtual ICollection<SubCollection> SubCollections { get; set; }
    }
}
