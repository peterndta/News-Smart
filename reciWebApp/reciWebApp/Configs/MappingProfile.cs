using AutoMapper;
using reciWebApp.Data.Models;
using reciWebApp.DTOs;
using reciWebApp.DTOs.CategoryDTOs;
using reciWebApp.DTOs.CookingMethodDTOs;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.DTOs.RecipeRegionDTOs;
using reciWebApp.DTOs.StepDTOs;
using reciWebApp.DTOs.UseDTOs;

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
<<<<<<< HEAD
=======
            CreateMap<Step, ShowStepDTO>();
>>>>>>> cebe0e2abe75c3ac3e76fdbfe7094b0c44c7c394
            CreateMap<UpdateStepDTO, Step>();
            CreateMap<Step, ShowStepDTO>();
            CreateMap<Category, ShowCategoryDTO>();
            CreateMap<CookingMethod, ShowCookingMethodDTO>();
            CreateMap<RecipeRegion, ShowRecipeRegionDTO>();
            CreateMap<CreatePostDTO, Step>();
            CreateMap<Use, ShowUseDTO>();
        }
    }
}
