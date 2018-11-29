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
    public class TokensController : Controller
    {
        private readonly ITokensService _tokensService;

        public TokensController(ITokensService tokensService)
        {
            _tokensService = tokensService;
        }

        public IActionResult TokenSettings()
        {
            return View(_tokensService.GetTokens());
        }

        [HttpGet]
        public IActionResult CreateTokenSettings()
        {
            return View();
        }

        [HttpPost]
        public IActionResult CreateTokenSettings(Token token)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _tokensService.SaveToken(token);
                    return RedirectPermanent("~/admin/Tokens/TokenSettings");
                }
            }
            catch (Exception ex)
            {

                token.DeveloperMessage = ex.Message;
            }
            return View(token);
        }


        [HttpGet]
        public IActionResult EditTokenSettings(int id)
        {
            return View(_tokensService.GetToken(id));
        }

        [HttpPost]
        public IActionResult EditTokenSettings(int id, Token token)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    token.Id = id;
                    _tokensService.SaveToken(token);
                    return RedirectPermanent("~/admin/Tokens/TokenSettings");
                }
            }
            catch (Exception ex)
            {

                token.DeveloperMessage = ex.Message;
            }
            return View(token);
        }

        [HttpGet]
        public IActionResult GrantedTokens() {
            return View(_tokensService.GetGrantedTokens());
        }

        [HttpPost]
        public JsonResult GrantTokenByAdmin(int userid)
        {
            try
            {
                 var token =  _tokensService.GrantTokenByAdmin(userid);
                return Json(new {
                    Success = true,
                    Token = token
                });
            }
            catch (Exception ex)
            {

                return Json(new
                {
                    Success = true,
                    Error = ex.Message
                });

            }
        }
    }
}