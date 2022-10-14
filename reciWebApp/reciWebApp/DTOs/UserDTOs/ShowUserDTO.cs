﻿namespace reciWebApp.DTOs.UserDTOs
{
    public class ShowUserDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public DateTime? BanTime { get; set; }
        public string Role { get; set; } 
        public string? ImageUrl { get; set; }
    }
}
