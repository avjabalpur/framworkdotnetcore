using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace unseentalents.web.Attributes
{
    public class USAuthAttribute : ActionFilterAttribute
    {
        /// <summary>
        /// Override on action executing function this is going to execute ones request will come
        /// in the app.
        /// </summary>
        /// <param name="filterContext">The http action context.</param>
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var viewData = filterContext.Controller;
            //if (!viewData.ModelState.IsValid)
            //{
            //    var error = viewData.ModelState.Values
            //        .Where(m => m.Errors.Count > 0)
            //        .Select(m => new
            //        {
            //            m.Errors
            //        }).FirstOrDefault(); ;
            //    if (error != null && error.Errors.Count > 0)
            //    {
            //        var errorMessage = error.Errors.FirstOrDefault().ErrorMessage;
            //        //throw new Exception(HttpStatusCode.BadRequest.ToString(), new Exception(errorMessage.ToString()));
            //    }
            //}
        }
    }
}
