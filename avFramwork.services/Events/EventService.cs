using System;
using System.Collections.Generic;
using System.Linq;
using avFramworktalents.Core;
using avFramworktalents.data;
using avFramworktalents.extensions;
using avFramworktalents.models;

namespace avFramworktalents.services
{
    public class EventService : IEventService
    {
        private avFramworkDbContext dbContext { get; }
        public EventService(avFramworkDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public IList<EventType> GetEventTypes()
        {
           return dbContext.EventType.Where(e => e.IsDeleted == false).ToList();
        }

        public EventType GetEventType(int id)
        {
            return dbContext.EventType.FirstOrDefault(e => e.IsDeleted == false && e.Id == id);
        }

        public bool SaveEvent(EventType eventType)
        {
            if (eventType.Id != 0)
            {
                var currentEvent = dbContext.EventType.FirstOrDefault(e => e.Id == eventType.Id);
                currentEvent.Name = eventType.Name;
                currentEvent.Description = eventType.Description;
                currentEvent.Active = eventType.Active;
            }
            else
            {
                dbContext.EventType.Add(new EventType
                {
                    Name = eventType.Name,
                    Description = eventType.Description,
                    Active = eventType.Active,
                    Created = DateTime.Now.ToAppDateTime()
                });
            }
           return dbContext.SaveChanges() > 0;
        }

        public bool DeleteEventType(int id)
        {
            var eventType = dbContext.EventType.FirstOrDefault(e => e.Id == id);
            eventType.IsDeleted = true;
            return dbContext.SaveChanges() > 0;
        }

        public IList<EventRounds> GetEventRounds(int eventTypeId)
        {
            return dbContext.EventRounds.Where(e => e.IsDeleted == false && e.EventType == eventTypeId).ToList();
        }

        public EventRounds GetEventRound(int roundId)
        {
            return dbContext.EventRounds.FirstOrDefault(e => e.Id == roundId);
        }

        public bool SaveEventRounds(EventRounds eventRounds)
        {
            dbContext.EventRounds.Add(new EventRounds
            {
                RoundName = eventRounds.RoundName,
                RoundDuration = eventRounds.RoundDuration,
                NoOfVideos = eventRounds.NoOfVideos,
                DaysDurations = eventRounds.DaysDurations,
                RoundOrderNo = eventRounds.RoundOrderNo,
                IsDeleted = false,
                ImageName = eventRounds.ImageName,
                ShowVotes = eventRounds.ShowVotes,
                IsActive = true,
                StartDate = eventRounds.StartDate,
                EndDate = eventRounds.EndDate,
                EventType = eventRounds.EventType,
                IsbackStage = eventRounds.IsbackStage,
                EventStage = eventRounds.EventStage,
            });

            return dbContext.SaveChanges() > 0;
        }

        public bool UpdateEventRounds(int roundId, EventRounds eventRounds)
        {
            var currentEvent = dbContext.EventRounds.FirstOrDefault(e => e.Id == roundId);
            currentEvent.RoundName = eventRounds.RoundName;
            currentEvent.RoundDuration = eventRounds.RoundDuration;
            currentEvent.NoOfVideos = eventRounds.NoOfVideos;
            currentEvent.DaysDurations = eventRounds.DaysDurations;
            currentEvent.RoundOrderNo = eventRounds.RoundOrderNo;
            currentEvent.ImageName = eventRounds.ImageName;
            currentEvent.ShowVotes = eventRounds.ShowVotes;
            currentEvent.IsActive = true;
            currentEvent.StartDate = eventRounds.StartDate;
            currentEvent.EndDate = eventRounds.EndDate;
            currentEvent.EventType = eventRounds.EventType;
            currentEvent.IsbackStage = eventRounds.IsbackStage;
            currentEvent.EventStage = eventRounds.EventStage;

            return dbContext.SaveChanges() > 0;
        }

        public bool DeleteEventRounds(int roundId, EventRounds eventRounds)
        {
            throw new NotImplementedException();
        }
    }
}
