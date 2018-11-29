using System;
using Microsoft.AspNetCore.Mvc;
using unseentalents.auth;
using unseentalents.models;
using unseentalents.services;

namespace unseentalents.web.Controllers
{
    public class AccountController : Controller
    {
        private readonly IAccountService _accountService;
        private readonly IAuthContext _authContext;

        public AccountController(IAccountService accountService, IAuthContext authContext)
        {
            _accountService = accountService;
            _authContext = authContext;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult Login(LoginModel loginRequest)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    loginRequest.Token = _authContext.Authenticate(loginRequest.UserName, loginRequest.Password);

                    //TODO need to store token in local memory or session and need to play on that
                    loginRequest.Success = true;
                }
            }
            catch (Exception ex)
            {
                loginRequest.Success = false;
                loginRequest.DeveloperMessage = ex.Message;
            }

            return Json(loginRequest);
        }


        [HttpPost]
        public JsonResult Register(RegisterModel user)
        {
            try
            {
                //if (ModelState.IsValid)
                //{
                    if (_accountService.RegisterUser(user))
                    {
                      string token = _authContext.Authenticate(user.UserName, user.Password);
                    }

                    else {
                        throw new Exception("Unable to registor user please try again later");
                    }

               // }
            }
            catch (Exception ex)
            {
                user.Success = false;
                user.DeveloperMessage = ex.Message;
            }
            return Json(user);
        }
    }
}