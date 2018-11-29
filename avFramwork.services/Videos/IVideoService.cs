using System;
using System.Collections.Generic;
using System.Text;
using avFramworktalents.core;
using avFramworktalents.models;
using avFramworktalents.models.ViewModel;

namespace avFramworktalents.services
{
    public interface IVideoService
    {
        bool UploadVideos(VideoUploadViewModel videoUploadViewModel);
        List<Video> GetVideosByRound(int roundId, bool isAll = false);
    }
}
