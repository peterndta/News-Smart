using AutoMapper;
using reciWebApp.Data.Models;
using reciWebApp.DTOs;
using reciWebApp.DTOs.CategoryDTOs;
using reciWebApp.DTOs.CollectionDTOs;
using reciWebApp.DTOs.CookingMethodDTOs;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.DTOs.PostReportDTO;
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
            CreateMap<Collection, ShowCollectionDTO>();
            CreateMap<CreateCollectionDTO, Collection>();
            CreateMap<CreateCategoryDTO, Category>();
            CreateMap<CreateCookingMethodDTO, CookingMethod>();
            CreateMap<User, ActivityDTO>();
            CreateMap<CreateUseDTO, Use>();
            CreateMap<Use, ShowUseDTO>();
            CreateMap<CreatePostReportDTO, PostReport>();
            CreateMap<PostReport, ShowPostReportDTO>();
            CreateMap<PostReport, ReturnReportDTO>();
            CreateMap<PostReportParams, ReturnReportDTO>();
            CreateMap<UserReportParams, ReturnReportDTO>();
        }
    }
}
