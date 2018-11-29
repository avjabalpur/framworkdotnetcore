using System;
using System.Collections.Generic;
using System.Text;

namespace avFramworktalents.models.ViewModel
{
    public class EventTypeViewModel
    {
        public EventTypeViewModel()
        {
            Rounds = new List<EventRounds>();
        }

        public EventType EventType { get; set; }

        public IList<EventRounds> Rounds { get; set; }
    }
}
