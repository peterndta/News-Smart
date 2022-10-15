using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.DTOs.CategoryDTOs;
using reciWebApp.Services.Utils;
using System.Net.WebSockets;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace reciWebApp.Controllers
{
    [Route("api/categories")]
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        private readonly IRepositoryManager _repoManager;
        private readonly IMapper _mapper;

        public CategoriesController(IRepositoryManager repoManager, IMapper mapper)
        {
            _repoManager = repoManager;
            _mapper = mapper;
        }

        // GET: api/<CategoriesController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                var categories = await _repoManager.Category.GetAllCategoryAsync();
                if (categories == null)
                {
                    return BadRequest(new Response(400, "Category is empty"));
                }

                var showCategories = _mapper.Map<List<ShowCategoryDTO>>(categories);

                return Ok(new Response(200, showCategories, ""));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }

        [Route("~/api/user/{id}/category")]
        [HttpPost]
        public async Task<IActionResult> CreateCategory (int id, [FromBody] CreateCategoryDTO categoryDTO)
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

                Category dbCategory = _repoManager.Category.GetCategoryByName(categoryDTO.Type);
                if(dbCategory != null)
                {
                    return BadRequest(new Response(400, "This category has already existed!"));
                }

                var createCategory = _mapper.Map<Category>(categoryDTO);
                _repoManager.Category.CreateCategory(createCategory);
                await _repoManager.SaveChangesAsync();

                var returnCategory = _mapper.Map<ShowCategoryDTO>(createCategory);
                return Ok(new Response(200, returnCategory, "Category is created sucessfully"));
            }
            catch(Exception e)
            {
                return BadRequest(new Response(400, e.Message));
            }
        }

    }
}
