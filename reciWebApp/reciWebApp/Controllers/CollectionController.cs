using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Hosting;
using Newtonsoft.Json.Linq;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.Data.Pagination;
using reciWebApp.DTOs.CollectionDTOs;
using reciWebApp.DTOs.PostDTOs;
using reciWebApp.Services.Interfaces;
using reciWebApp.Services.Utils;

namespace reciWebApp.Controllers
{
    [Route("api/collection")]
    [ApiController]
    public class CollectionController : ControllerBase
    {
        private readonly IRepositoryManager _repoManager;
        private readonly IMapper _mapper;
        private readonly IServicesManager _servicesManager;
        public CollectionController(IRepositoryManager repoManager, IMapper mapper, IServicesManager servicesManager)
        {
            _repoManager = repoManager;
            _mapper = mapper;
            _servicesManager = servicesManager;
        }

        [Route("~/api/admin/collection")]
        [HttpPost]
        public async Task<IActionResult> CreateCollection([FromBody] CreateCollectionDTO collectionDTO)
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

                var createCollection = _mapper.Map<Collection>(collectionDTO);

                Collection dbCollection = _repoManager.Collection.GetCollectionByName(collectionDTO.CollectionName);
                if (dbCollection != null)
                {
                    return BadRequest(new Response(400, "This collection has already existed"));
                }

                _repoManager.Collection.CreateCollection(createCollection);
                await _repoManager.SaveChangesAsync();

                var returnCollection = _mapper.Map<ShowCollectionDTO>(createCollection);
                return Ok(new Response(200, returnCollection));
            }
            catch (Exception e)
            {
                return BadRequest (new Response (400, e.Message));
            }
        }
    }
}
