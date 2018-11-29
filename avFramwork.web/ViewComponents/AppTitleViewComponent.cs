using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using unseentalents.auth;

namespace unseentalents.web.ViewComponents
{
    [ViewComponent(Name = "AppTitle")]
    public class AppTitleViewComponent : ViewComponent
    {
        private readonly IAuthContext _authContext;
        public AppTitleViewComponent(IAuthContext authContext)
        {
            _authContext = authContext;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            //if (_authContext.IsAuthenticated)
           // {
                var authUsers = _authContext.User;
                return await Task.Run(() => View(authUsers));
           // }

            return await Task.Run(() => View(null));
        }
    }
}
