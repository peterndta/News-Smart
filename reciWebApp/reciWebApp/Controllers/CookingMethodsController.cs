using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.DTOs.CookingMethodDTOs;
using reciWebApp.Services.Interfaces;
using reciWebApp.Services.Utils;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace reciWebApp.Controllers
{
    [Route("api/cookingmethod")]
    [ApiController]
    public class CookingMethodsController : ControllerBase
    {
        private readonly IRepositoryManager _repoManager;
        private readonly IMapper _mapper;
        private readonly IServicesManager _servicesManager;
        public CookingMethodsController(IRepositoryManager repoManager, IMapper mapper, IServicesManager servicesManager)
        {
            _repoManager = repoManager;
            _mapper = mapper;
            _servicesManager = servicesManager;
        }

        // GET: api/<CookingMethodsController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                var cookingMethods = await _repoManager.CookingMethod.GetAllCookingMethodsAsync();
                if (cookingMethods == null)
                {
                    return BadRequest(new Response(400, "Cooking methods is empty"));
                }

                var showCookingMethods = _mapper.Map<List<ShowCookingMethodDTO>>(cookingMethods);
                return Ok(new Response(200, showCookingMethods));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }

        [Route("~/api/admin/cookingMethod")]
        [HttpPost]
        public async Task<IActionResult> CreateCookingMethod (int id, [FromBody] CreateCookingMethodDTO cookingMethodDTO)
        {
            try
            {
                var user = await _repoManager.User.GetUserByIdAsync(id);

                if (user == null)
                {
                    return BadRequest(new Response(400, "User id does not existed"));
                }

                if (!user.Role.Equals("admin"))
                {
                    return BadRequest(new Response(400, "You do not have permission"));
                }

                CookingMethod dbcookingMethod = _repoManager.CookingMethod.GetCookingMethodByNameSignle(cookingMethodDTO.Method);
                if (dbcookingMethod != null)
                {
                    return BadRequest(new Response(400, "This cooking method has already existed!"));
                }

                var createCookingMehthod = _mapper.Map<CookingMethod>(cookingMethodDTO);
                _repoManager.CookingMethod.CreateCookingMethod(createCookingMehthod);
                await _repoManager.SaveChangesAsync();

                var returnCookingMethod = _mapper.Map<ShowCookingMethodDTO>(createCookingMehthod);

                return Ok(new Response(200, returnCookingMethod, "Create cooking method sucessfully"));
            }
            catch (Exception e)
            {
                return BadRequest(new Response(400, e.Message));
            }
        }
    }
}
