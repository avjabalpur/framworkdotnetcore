using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using unseentalents.models;
using unseentalents.models.ViewModel;
using unseentalents.services;

namespace unseentalents.web.Controllers
{
    public class PaymentController : Controller
    {
         private readonly ITokensService _tokenService;

        public PaymentController(ITokensService tokensService)
        {
            _tokenService = tokensService;
        }

        public async Task<IActionResult> Index()
        {
            return await Task.Run(() => View(_tokenService.GetTokens()));
        }

    }
}