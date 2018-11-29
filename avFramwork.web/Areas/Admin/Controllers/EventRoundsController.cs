using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using unseentalents.models;
using unseentalents.models.ViewModel;
using unseentalents.services;

namespace unseentalents.web.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class EventRoundsController : Controller
    {

        private readonly IEventService _eventService;
        private readonly IHostingEnvironment _appEnvironment;
        private readonly IVideoService _videoService;


        public EventRoundsController(IEventService eventService, IHostingEnvironment appEnvironment, IVideoService videoService)
        {
            _eventService = eventService;
            _appEnvironment = appEnvironment;
            _videoService = videoService;
        }


        // GET: EventRounds
        public ActionResult Index(int id)
        {
            return View(_eventService.GetEventRounds(id));
        }

        // GET: EventRounds/Details/5
        public ActionResult Details(int id)
        {
            return View(_eventService.GetEventRound(id));
        }

        // GET: EventRounds/Create
        public ActionResult Create(int id)
        {
            return View(new EventRounds {
                EventType = id
            });
        }

        // POST: EventRounds/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(EventRounds round)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var files = HttpContext.Request.Form.Files;
                    foreach (var Image in files)
                    {
                        if (Image != null && Image.Length > 0)
                        {
                            var file = Image;
                            //There is an error here
                            var uploads = Path.Combine(_appEnvironment.WebRootPath, "Uploads\\EventImages");
                            if (file.Length > 0)
                            {
                                var fileName = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(file.FileName);
                                using (var fileStream = new FileStream(Path.Combine(uploads, fileName), FileMode.Create))
                                {
                                    await file.CopyToAsync(fileStream);
                                    round.ImageName = fileName;
                                }

                            }
                        }
                    }

                    _eventService.SaveEventRounds(round);
                    return RedirectToAction(nameof(Index), new {id = round.EventType });
                }
               
            }
            catch (Exception ex)
            {
                round.DeveloperMessage = ex.Message;
            }
            return View(round);
        }

        // GET: EventRounds/Edit/5
        public ActionResult Edit(int id)
        {
            return View(_eventService.GetEventRound(id));
        }

        // POST: EventRounds/Edit/5
        [HttpPost]
        public async Task<ActionResult> Edit(int id, EventRounds round)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var files = HttpContext.Request.Form.Files;
                    foreach (var Image in files)
                    {
                        if (Image != null && Image.Length > 0)
                        {
                            var file = Image;
                            //There is an error here
                            var uploads = Path.Combine(_appEnvironment.WebRootPath, "Uploads\\EventImages");
                            if (file.Length > 0)
                            {
                                var fileName = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(file.FileName);
                                using (var fileStream = new FileStream(Path.Combine(uploads, fileName), FileMode.Create))
                                {
                                    await file.CopyToAsync(fileStream);
                                    round.ImageName = fileName;
                                }

                            }
                        }
                    }

                    _eventService.UpdateEventRounds(id, round);
                    return RedirectToAction(nameof(Index), new { id = round.EventType });
                }

            }
            catch (Exception ex)
            {
                round.DeveloperMessage = ex.Message;
            }
            return View(round);
        }

        // GET: EventRounds/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: EventRounds/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        [HttpGet]
        public ActionResult EventRoundVideos(int id) {
            return View(_videoService.GetVideosByRound(id, true));
            
        }
    }
}