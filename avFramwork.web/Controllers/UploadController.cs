using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using unseentalents.auth;
using unseentalents.models.ViewModel;
using unseentalents.services;

namespace unseentalents.web.Controllers
{
    public class UploadController : BaseController
    {
        private readonly IEventService _eventService;
         private readonly ITokensService _tokenService;
        private readonly IAuthContext _authContext;
        private readonly IHostingEnvironment _appEnvironment;
        private readonly IVideoService _videoService;

        public UploadController(IEventService eventService, ITokensService tokenService, IAuthContext authContext, IHostingEnvironment appEnvironment, IVideoService videoService) : base(authContext)
        {
            _eventService = eventService;
            _tokenService = tokenService;
            _authContext = authContext;
            _appEnvironment = appEnvironment;
            _videoService = videoService;
        }

        public async Task<IActionResult> Index()
        {
            var currentEvents = _eventService.GetEventTypes().Where(x => x.Active);
            
            if (_authContext.User != null)
            {
                var tokens = new List<SelectListItem>();
                foreach (var item in _tokenService.GetGrantedTokensByUserId(_authContext.User.User.Id))
                {
                    tokens.Add(new SelectListItem {
                        Text = item.UniqueToken,
                        Value = item.UniqueToken
                    });
                }
                return await Task.Run(() => View(new VideoUploadViewModel
                {
                    EventTypes = currentEvents.ToList(),
                    UserTokens = tokens,
                    MaskingTypes = _tokenService.GetMaskingType()
                }));
            }
            return await Task.Run(() => View(new VideoUploadViewModel
            {
                EventTypes = currentEvents.ToList(),
                UserTokens = new List<SelectListItem>(),
            }));
        }

        [HttpPost]
        public async Task<IActionResult> Index(VideoUploadViewModel videoUploadViewModel)
        {
            if (_authContext.User !=null)
            {

                videoUploadViewModel.Video.UserId = _authContext.User.User.Id;

            if (!_tokenService.CheckIsTokenValid(videoUploadViewModel.Video.TokenUniqueId, 1))
            {
                videoUploadViewModel.Video.DeveloperMessage = "Token is not valid";
            }
            var uploads = Path.Combine(_appEnvironment.WebRootPath, "Uploads\\Videos");
            var files = HttpContext.Request.Form.Files;
                foreach (var file in files)
                {
                    if (file != null && file.Length > 0)
                    {
                       
                        if (file.Length > 0)
                        {
                            var fileName = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(file.FileName);
                            using (var fileStream = new FileStream(Path.Combine(uploads, fileName), FileMode.Create))
                            {
                                await file.CopyToAsync(fileStream);
                                videoUploadViewModel.Video.VideoPath = fileName;
                            }
                        }
                    }
                }

            var thumblineName = Path.ChangeExtension(videoUploadViewModel.Video.VideoPath, "jpg");
            CreateAndSaveVideoThumbnail(videoUploadViewModel.Video.VideoPath, Path.Combine(uploads, thumblineName));
            videoUploadViewModel.Video.VideoThumblinePath = thumblineName;
            _videoService.UploadVideos(videoUploadViewModel);
            }

            return await Task.Run(() => Index());



        }

        private void CreateAndSaveVideoThumbnail(string inputFile, string outputFile)
        {
            try
            {
                var ffMpeg = new NReco.VideoConverter.FFMpegConverter();
                ffMpeg.GetVideoThumbnail(inputFile, outputFile, 5);
            }
            catch (Exception ex)
            {
                var dd = ex.Message;
                // CommonHelpers.Logger(ex.Message);
            }

        }
    }
}