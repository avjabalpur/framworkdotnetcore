using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using unseentalents.models;
using unseentalents.services;

namespace unseentalents.web.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class EventsController : Controller
    {
        private readonly IEventService _eventService;

        public EventsController(IEventService eventService)
        {
            _eventService = eventService;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult EventTypes()
        {
            
            return View(_eventService.GetEventTypes());
        }

        [HttpGet]
        public IActionResult EventType(int id=0)
        {
            return View(_eventService.GetEventType(id));
        }

        [HttpPost]
        public IActionResult EventType(EventType eventType)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _eventService.SaveEvent(eventType);
                    return RedirectPermanent("~/admin/Events/EventTypes");
                }
            }
            catch (Exception ex)
            {

                eventType.DeveloperMessage = ex.Message;
            }
            return View(eventType);
        }

        [HttpDelete]
        public IActionResult DeleteEventType(int id)
        {
            try
            {
                    _eventService.DeleteEventType(id);
            }
            catch 
            {
            }
            return RedirectPermanent("~/admin/Events/EventTypes");
        }
    }
}