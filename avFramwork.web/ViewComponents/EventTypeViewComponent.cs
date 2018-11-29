using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Threading.Tasks;
using unseentalents.auth;
using unseentalents.services;

namespace unseentalents.web.ViewComponents
{
    [ViewComponent(Name = "EventType")]
    public class EventTypeViewComponent : ViewComponent
    {
        private readonly IEventService _eventService;
        public EventTypeViewComponent(IEventService eventService)
        {
            _eventService = eventService;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            return await Task.Run(() => View(_eventService.GetEventTypes().Where(x => x.Active == true).ToList()));
        }
    }
}
