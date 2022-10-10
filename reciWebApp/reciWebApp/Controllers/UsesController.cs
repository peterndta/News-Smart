using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using reciWebApp.Data.IRepositories;
using reciWebApp.DTOs.CategoryDTOs;
using reciWebApp.DTOs.UseDTOs;
using reciWebApp.Services.Utils;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace reciWebApp.Controllers
{
    [Route("api/[controller]")]
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
    }
}
