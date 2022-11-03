using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using reciWebApp.Data.Pagination;
using reciWebApp.DTOs.StepDTOs;
using reciWebApp.Services.Interfaces;
using reciWebApp.Services.Utils;

namespace reciWebApp.Controllers
{
    [Route("api/step")]
    [ApiController]
    public class StepsController : ControllerBase
    {
        private readonly IRepositoryManager _repoManager;
        private readonly IServicesManager _servicesManager;
        private readonly IMapper _mapper;

        public StepsController(IRepositoryManager repoManager, IMapper mapper, IServicesManager servicesManager)
        {
            _repoManager = repoManager;
            _mapper = mapper;
            _servicesManager = servicesManager;
        }

        [HttpGet("id")]
        public async Task <IActionResult> GetStepById(int id)
        {
            try
            {
                var step = await _repoManager.Step.GetStepByIdAsync(id);

                if (step == null)
                {
                    return BadRequest(new Response(400, "Step Id does not exist!"));
                }
                
                var showStep = _mapper.Map<ShowStepDTO>(step);

                return Ok(new Response(200, showStep));
            }
            catch(Exception e)
            {
                return BadRequest (new Response(500, e.Message));
            }
        }

        [Route("~/api/post/{id}/step")]
        [HttpGet]
        public async Task<IActionResult> Get(string id)
        {
            try
            {
                var step = await _repoManager.Step.GetStepByPostIdAsync(id);
                
                if (step == null)
                {
                    return BadRequest(new Response(400, "Post does not have any step"));
                }

                var showStep = _mapper.Map<ShowStepDTO>(step);
                return Ok(new Response(200, showStep));
            }
            catch (Exception ex)
            {
                return BadRequest(new Response(500, ex.Message));
            }
        }

        ////[Route("~/api/post/{id}/step")]
        ////[HttpPost]
        ////public async Task<IActionResult> CreateStep(string id, [FromBody] CreateStepDTO stepDTO)
        ////{
        ////    try
        ////    {
        ////        var post = await _repoManager.Post.GetPostByIdAsync(id);

        ////        if(post == null)
        ////        {
        ////            return BadRequest (new Response(400, "Post id does not exist!"));
        ////        }

        //        var createStep = _mapper.Map<Step>(stepDTO);
        //        createStep.PostsId = id;
        //        _repoManager.Step.CreateStep(createStep);
        //        await _repoManager.SaveChangesAsync();
        //        return Ok (new Response(200));
        //    }
        //    catch(Exception e)
        //    {
        //        return BadRequest(new Response(500, e.Message));
        //    }
        //}

        //        var createStep = _mapper.Map<Step>(stepDTO);
        //        createStep.PostsId = id;
        //        createStep.Id = Int32.Parse(DateTime.Now.ToString("yyyyMMddHHmmssffff"));
        //        _repoManager.Step.CreateStep(createStep);
        //        await _repoManager.SaveChangesAsync();
        //        return Ok (new Response(200));
        //    }
        //    catch(Exception e)
        //    {
        //        return BadRequest(new Response(500, e.Message));
        //    }
        //}


        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateStep(int id, [FromBody] UpdateStepDTO updateStepDTO)
        {
            try
            {               
                var step = await _repoManager.Step.GetStepByIdAsync(id);
                if(step == null)
                {
                    return BadRequest (new Response(400, "Invalid step id"));
                }

                var post = await _repoManager.Post.GetActivePostByIdAsync(step.PostsId);
                if(post == null)
                {
                    return BadRequest (new Response(400, "Invalid post id"));
                }

                if(!_servicesManager.PostService.CheckPostAuthority(4, post.Id))
                {
                    return BadRequest(new Response(400, "You do not have permission"));
                }

                step = _mapper.Map<Step>(updateStepDTO);
                _repoManager.Step.UpdateStep(step);
                await _repoManager.SaveChangesAsync();
                return Ok(new Response(200, "Update successfully"));
            }
            catch (Exception e)
            {
                return BadRequest(new Response(500, e.Message));
            }
        }


    }
}