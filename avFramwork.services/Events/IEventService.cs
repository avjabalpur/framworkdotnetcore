using System;
using System.Collections.Generic;
using System.Text;
using avFramworktalents.models;

namespace avFramworktalents.services
{
   public interface IEventService
    {
        IList<EventType> GetEventTypes();
        EventType GetEventType(int id);
        bool SaveEvent(EventType eventType);
        bool DeleteEventType(int id);

        IList<EventRounds> GetEventRounds(int eventTypeId);
        EventRounds GetEventRound(int roundId);
        bool SaveEventRounds(EventRounds eventRounds);
        bool UpdateEventRounds(int roundId, EventRounds eventRounds);
        bool DeleteEventRounds(int roundId, EventRounds eventRounds);
    }
}
