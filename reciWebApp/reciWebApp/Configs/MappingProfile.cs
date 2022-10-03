using AutoMapper;
using reciWebApp.Data.Models;
using reciWebApp.DTOs;

namespace reciWebApp.Configs
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<CreatePostDTO, Post>();
            CreateMap<Post, ShowPostDTO>();
            CreateMap<UpdatePostDTO, Post>();
        }
    }
}
