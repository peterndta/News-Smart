using System;
using System.Collections.Generic;

namespace reciWebApp.Data.Models
{
    public partial class User
    {
        public User()
        {
            PostReports = new HashSet<PostReport>();
            Posts = new HashSet<Post>();
            UserInteracts = new HashSet<UserInteract>();
        }

        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Email { get; set; }
        public DateTime? BanTime { get; set; }
        public string? Role { get; set; }
        public string? ImageUrl { get; set; }

        public virtual ICollection<PostReport> PostReports { get; set; }
        public virtual ICollection<Post> Posts { get; set; }
        public virtual ICollection<UserInteract> UserInteracts { get; set; }

        public void UserMock()
        {
            var users = new List<User>()
            {
                new User
                {
                  Id = 1,
                    Name = "Trung Nguyen",
                    Email= "nktnguyen2001@gmail.com",
                    BanTime = new DateTime(20221, 09, 28),
                    Role = "user",
                    ImageUrl = "https://media.istockphoto.com/photos/illustration-of-smiling-happy-man-with-laptop-sitting-in-armchair-picture-id1226886130?s=612x612",
                },
                new User
                {
                    Id = 2,
                    Name = "The Hien",
                    Email= "hienbui25g@gmail.com",
                    BanTime = new DateTime(20221, 09, 29),
                    Role = "user",
                    ImageUrl = "https://media.istockphoto.com/photos/illustration-of-smiling-happy-man-with-laptop-sitting-in-armchair-picture-id1226886130?s=612x612",
                },
                new User
                {
                    Id = 3,
                    Name = "Truong Anh",
                    Email = "truonganh@gmail.com",
                    BanTime = new DateTime(20221, 09, 29),
                    Role = "user",
                    ImageUrl = "https://media.istockphoto.com/photos/illustration-of-smiling-happy-man-with-laptop-sitting-in-armchair-picture-id1226886130?s=612x612",
                },
                new User
                {
                    Id = 4,
                    Name = "Gia Phat",
                    Email = "giaphat@gmail.com",
                    BanTime = new DateTime(20221, 09, 30),
                    Role = "user",
                    ImageUrl = "https://media.istockphoto.com/photos/illustration-of-smiling-happy-man-with-laptop-sitting-in-armchair-picture-id1226886130?s=612x612",
                },
                new User
                {
                    Id = 5,
                    Name = "Bao Khương",
                    Email = "baokhuong@gmail.com",
                    BanTime = new DateTime(20221, 09, 29),
                    Role = "user",
                    ImageUrl = "https://media.istockphoto.com/photos/illustration-of-smiling-happy-man-with-laptop-sitting-in-armchair-picture-id1226886130?s=612x612",
                },
                new User
                {
                    Id = 6,
                    Name = "Phuoc Su",
                    Email = "phuocsu@gmail.com",
                    BanTime = new DateTime(20221, 09, 29),
                    Role = "user",
                    ImageUrl = "https://media.istockphoto.com/photos/illustration-of-smiling-happy-man-with-laptop-sitting-in-armchair-picture-id1226886130?s=612x612",
                },
                new User
                {
                    Id = 7,
                    Name = "Trung Thong",
                    Email = "trungthong@gmail.com",
                    BanTime = new DateTime(20221, 09, 29),
                    Role = "user",
                    ImageUrl = "https://media.istockphoto.com/photos/illustration-of-smiling-happy-man-with-laptop-sitting-in-armchair-picture-id1226886130?s=612x612",
                },
                new User
                {
                    Id = 8,
                    Name = "Duc Minh",
                    Email = "ducminh@gmail.com",
                    BanTime = new DateTime(20221, 09, 29),
                    Role = "user",
                    ImageUrl = "https://media.istockphoto.com/photos/illustration-of-smiling-happy-man-with-laptop-sitting-in-armchair-picture-id1226886130?s=612x612",
                },
                new User
                {
                    Id = 9,
                    Name = "Quang Quyen",
                    Email = "quangquyen@gmail.com",
                    BanTime = new DateTime(20221, 09, 29),
                    Role = "user",
                    ImageUrl = "https://media.istockphoto.com/photos/illustration-of-smiling-happy-man-with-laptop-sitting-in-armchair-picture-id1226886130?s=612x612",
                },
                new User
                {
                    Id = 10,
                    Name = "Hong Anh",
                    Email = "honganh@gmail.com",
                    BanTime = new DateTime(20221, 09, 29),
                    Role = "user",
                    ImageUrl = "https://media.istockphoto.com/photos/illustration-of-smiling-happy-man-with-laptop-sitting-in-armchair-picture-id1226886130?s=612x612",
                }
            };
            users.AddRange(users);
        }
    }


}
