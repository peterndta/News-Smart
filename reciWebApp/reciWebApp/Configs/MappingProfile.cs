using AutoMapper;
using reciWebApp.Data.Models;
using reciWebApp.DTOs;
using reciWebApp.DTOs.CategoryDTOs;
using reciWebApp.DTOs.CookingMethodDTOs;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.DTOs.RecipeRegionDTOs;
using reciWebApp.DTOs.StepDTOs;
using reciWebApp.DTOs.UseDTOs;
using reciWebApp.DTOs.UserDTOs;

namespace reciWebApp.Configs
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<CreatePostDTO, Post>();
            CreateMap<Post, ShowPostDTO>();
            CreateMap<UpdatePostDTO, Post>();
            CreateMap<AuthMobile, User>();
            CreateMap<CreateStepDTO, Step>();
            CreateMap<Step, ShowStepDTO>();
            CreateMap<UpdateStepDTO, Step>();
            CreateMap<Step, ShowStepDTO>();
            CreateMap<Category, ShowCategoryDTO>();
            CreateMap<CookingMethod, ShowCookingMethodDTO>();
            CreateMap<RecipeRegion, ShowRecipeRegionDTO>();
            CreateMap<CreatePostDTO, Step>();
            CreateMap<Use, ShowUseDTO>();
            CreateMap<ShowPostDTO, ShowDetailPostDTO>();
            CreateMap<User, ShowUserDTO>();
        }
    }
}
