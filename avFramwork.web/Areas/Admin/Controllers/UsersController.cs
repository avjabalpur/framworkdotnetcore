using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using unseentalents.models;
using unseentalents.services;

namespace unseentalents.web.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class UsersController : Controller
    {

        private readonly IUserService _userservice;

        public UsersController(IUserService usersService)
        {
            _userservice = usersService;
        }

        [HttpGet]
        public IActionResult Index()
        {
            return View(_userservice.GetUsers());
        }

        [HttpGet]
        public IActionResult UserDetails(int id)
        {
            return View(_userservice.GetUser(id));
        }


        
    }
}