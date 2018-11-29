using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using unseentalents.auth;
using unseentalents.web.Attributes;

namespace unseentalents.web.Controllers
{

    public class BaseController : Controller
    {
        private readonly IAuthContext _authContext;

        public BaseController(IAuthContext authContext)
        {
            _authContext = authContext;
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            onActionExecuting(filterContext);
            base.OnActionExecuting(filterContext);
        }

        private void onActionExecuting(ActionExecutingContext filterContext)
        {
            if (_authContext.User == null)
            {
                ViewBag.needLogin = true;
            }
        }
    }
}