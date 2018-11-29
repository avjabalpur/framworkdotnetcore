using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Text;

namespace avFramworktalents.models.ViewModel
{
    public class VideoUploadViewModel
    {
        public VideoUploadViewModel()
        {
            Video = new Video();
            EventTypes = new List<EventType>();
            MaskingTypes = new List<MaskingType>();
        }

        public Video Video { get; set; }
        public IList<EventType> EventTypes { get; set;}

        public IList<MaskingType> MaskingTypes { get; set; }

        public IEnumerable<SelectListItem> UserTokens { get; set; }

    }
}
