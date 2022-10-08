using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using reciWebApp.Data.IRepositories;
using reciWebApp.DTOs.RecipeRegionDTOs;
using reciWebApp.Services.Interfaces;
using reciWebApp.Services.Utils;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace reciWebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RecipeRegionsController : ControllerBase
    {
        private readonly IRepositoryManager _repoManager;
        private readonly IMapper _mapper;
        private readonly IServicesManager _servicesManager;
        public RecipeRegionsController(IRepositoryManager repoManager, IMapper mapper, IServicesManager servicesManager)
        {
            _repoManager = repoManager;
            _mapper = mapper;
            _servicesManager = servicesManager;
        }
        // GET: api/<RecipeRegionsController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                var recipeRegions = await _repoManager.RecipeRegion.GetAllRecipeRegionsAsync();
                if (recipeRegions == null)
                {
                    return BadRequest(new Response(400, "Recipe regions is empty"));
                }

                var showRecipeRegions = _mapper.Map<List<ShowRecipeRegionDTO>>(recipeRegions);
                return Ok(new Response(200, showRecipeRegions));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }
    }
}
