using AutoMapper;
using reciWebApp.Data.Models;
using reciWebApp.DTOs;
using reciWebApp.DTOs.CategoryDTOs;
using reciWebApp.DTOs.CookingMethodDTOs;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.DTOs.RecipeRegionDTOs;
using reciWebApp.DTOs.StepDTOs;

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
            CreateMap<Step, ShowPostDTO>();
            CreateMap<UpdateStepDTO, Step>();
            CreateMap<Category, ShowCategoryDTO>();
            CreateMap<CookingMethod, ShowCookingMethodDTO>();
            CreateMap<RecipeRegion, ShowRecipeRegionDTO>();
        }
    }
}
