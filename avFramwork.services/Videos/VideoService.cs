using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using avFramworktalents.core;
using avFramworktalents.Core;
using avFramworktalents.data;
using avFramworktalents.extensions;
using avFramworktalents.models;
using avFramworktalents.models.ViewModel;

namespace avFramworktalents.services
{
    public class VideoService : IVideoService
    {

        private avFramworkDbContext dbContext { get; }
        public VideoService(avFramworkDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public bool UploadVideos(VideoUploadViewModel videoUploadViewModel)
        {
            var round = dbContext.EventRounds.FirstOrDefault(x => x.EventType == videoUploadViewModel.Video.EventTypeId && x.EventStage == EventStages.Backstage);
            if (round!=null)
            {
                videoUploadViewModel.Video.CompetitionRound = Convert.ToInt32(round.Id);
                videoUploadViewModel.Video.CreatedDate = DateTime.Now.ToAppDateTime();
                videoUploadViewModel.Video.CompetitionQualifiedDate = DateTime.Now.ToAppDateTime();
                videoUploadViewModel.Video.IsActive = false;
                videoUploadViewModel.Video.Eventstage = 200;
                dbContext.Video.Add(videoUploadViewModel.Video);
                dbContext.SaveChanges();
                return true;
            }
            return false;
           
        }

        public List<Video> GetVideosByRound(int roundId, bool isAll = false)
        {
            var videos = dbContext.Video.Where(v => v.CompetitionRound> 57 && v.CompetitionRound == roundId && (isAll == false) ? v.IsActive == true : true).ToList();
            var round = dbContext.EventRounds.FirstOrDefault(x => x.Id.ToString() == roundId.ToString());
            if (videos !=null && videos.Count>0)
            {
                foreach (var video in videos)
                {
                    var user = dbContext.Users.FirstOrDefault(x => x.Id == video.Id);
                    video.UserName = $"{user.FirstName} {user.LastName}";
                    //video.EventType = dbContext.EventType.FirstOrDefault(x => x.Id == video.EventTypeId).Name;
                }
            }
            return videos;
        }
    }

}
