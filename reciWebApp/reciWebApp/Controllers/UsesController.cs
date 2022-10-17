using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.DTOs.CategoryDTOs;
using reciWebApp.DTOs.CollectionDTOs;
using reciWebApp.DTOs.UseDTOs;
using reciWebApp.Services.Utils;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace reciWebApp.Controllers
{
    [Route("api/uses")]
    [ApiController]
    public class UsesController : ControllerBase
    {
        private readonly IRepositoryManager _repoManager;
        private readonly IMapper _mapper;

        public UsesController(IRepositoryManager repoManager, IMapper mapper)
        {
            _repoManager = repoManager;
            _mapper = mapper;
        }
        // GET: api/<UsesController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                var uses = await _repoManager.Use.GetAllUseAsync();
                if (uses == null)
                {
                    return BadRequest(new Response(400, "Uses is empty"));
                }

                var showUses = _mapper.Map<List<ShowUseDTO>>(uses);

                return Ok(new Response(200, showUses, ""));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }

        [Route("~/api/admin/use")]
        [HttpPost]
        public async Task<IActionResult> CreateUse([FromBody] CreateUseDTO useDTO)
        {
            try
            {
                //var user = await _repoManager.User.GetUserByIdAsync(id);

                //if (user == null)
                //{
                //    return BadRequest(new Response(400, "User id does not existed"));
                //}

                //if (!user.Role.Equals("admin"))
                //{
                //    return BadRequest(new Response(400, "You do not have permission"));
                //}

                var createUse = _mapper.Map<Use>(useDTO);

                Use dbUse = _repoManager.Use.GetUsesByNameSingle(useDTO.UsesOfFood);
                if (dbUse != null)
                {
                    return BadRequest(new Response(400, "This use of food has already existed"));
                }

                _repoManager.Use.CreateUse(createUse);
                await _repoManager.SaveChangesAsync();

                var returnCollection = _mapper.Map<ShowUseDTO>(createUse);
                return Ok(new Response(200, returnCollection));
            }
            catch (Exception e)
            {
                return BadRequest(new Response(400, e.Message));
            }
        }
    }
}
