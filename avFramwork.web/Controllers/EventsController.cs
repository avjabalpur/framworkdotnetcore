using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using unseentalents.models.ViewModel;
using unseentalents.services;

namespace unseentalents.web.Controllers
{
    public class EventsController : Controller
    {

        private readonly IEventService _eventService;
        private readonly IVideoService _videoService;
        public EventsController(IEventService eventService, IVideoService videoService)
        {
            _eventService = eventService;
            _videoService = videoService;
        }

        [Route("events/{eventname}")]
        public async Task<IActionResult> Index(string eventname)
        {
            var currentEvent = _eventService.GetEventTypes().FirstOrDefault(x => x.Name.Replace(" ", "") == eventname);
            if (currentEvent != null)
            {
                var eventRounds = _eventService.GetEventRounds(Convert.ToInt32(currentEvent.Id));

                return await Task.Run(() => View(new EventTypeViewModel
                {
                    EventType = currentEvent,
                    Rounds = eventRounds
                }));
            }

            return await Task.Run(() => View(new EventTypeViewModel { }));

        }

        [Route("events/{eventname}/{roundId}")]
        public async Task<IActionResult> RoundVideo(string eventname, int roundId)
        {
                var eventRound = _eventService.GetEventRound(Convert.ToInt32(roundId));
            var roundVideos = _videoService.GetVideosByRound(roundId);
                return await Task.Run(() => View(new EventRoundsViewModel
                {
                    Round = eventRound,
                    Videos = roundVideos
                }));

        }
    }
}