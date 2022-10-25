using reciWebApp.Data.Models;
using reciWebApp.DTOs.PostDTOs;

namespace reciWebApp.DTOs.SubCollectionDTOs
{
    public class ShowSubCollectionDTO
    {
        public string Id { get; set; } 
        public int? CollectionId { get; set; }
        public List<ShowPostDTO> Post { get; set; } = new List<ShowPostDTO>();
    }
}
