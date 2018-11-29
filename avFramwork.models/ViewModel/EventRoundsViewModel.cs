using System;
using System.Collections.Generic;
using System.Text;

namespace avFramworktalents.models.ViewModel
{
   public class EventRoundsViewModel
    {
        public EventRoundsViewModel()
        {
            Round = new EventRounds();
            Videos = new List<Video>();
        }
        public EventRounds Round { get; set; }
        public List<Video> Videos { get; set; }
    }
}
