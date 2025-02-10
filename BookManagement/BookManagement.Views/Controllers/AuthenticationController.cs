using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using BookManagement.Application;
using BookManagement.Domain.ObjectValues;
using BookManagement.Views.Service;
using BookManagement.Views.Models;
using BookManagement.Domain.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authentication.Google;
using System.Security.Claims;

namespace BookManagement.Views.Controllers
{
    public class AuthenticationController : Controller
    {
        private readonly IUserAccountService _userAccountService;
        private readonly SignInManager<UserAccount> _signInManager;

        public AuthenticationController(IUserAccountService userAccountService, SignInManager<UserAccount> signInManager)
        {
            _userAccountService = userAccountService;
            _signInManager = signInManager;
        }

        public IActionResult IndexSignIn()
        {
            AuthenticationModel model = new AuthenticationModel();
            return View("Login", model);
        }

        public IActionResult IndexRegister()
        {
            AuthenticationModel model = new AuthenticationModel();
            return View("Register", model);
        }

        public async Task<IActionResult> LogIn(SignIn signIn)
        {
            try
            {
                var result = await _userAccountService.SignInFromServiceAsync(signIn);

                if (result == true)
                {
                    var user = await _userAccountService.SearchUserFromServiceAsync(signIn.Email);
                    // Lưu vào Session dưới dạng JSON
                    HttpContext.Session.SetObject("UserInfo", user);
                    return RedirectToAction("Index", "Book");
                }
                TempData["Fail"] = "Email or Password is incorrect!";
                return View();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        public async Task<IActionResult> LogOut()
        {
            try
            {
                HttpContext.Session.Remove("UserInfo");
                HttpContext.Response.Cookies.Delete(".AspNetCore.Session");
                HttpContext.Response.Cookies.Delete(".AspNetCore.Antiforgery.2hD5UAaI76o");
                await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
                await _userAccountService.SignOutFromServiceAsync();
                return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }      
        }

        public async Task<IActionResult> Register(SignUpUser signUpUser)
        {
            try
            {
                var result = await _userAccountService.SignUpUserFromServiceAsync(signUpUser);

                if (result.Succeeded)
                {
                    return RedirectToAction("IndexSignIn", "Authentication");
                }

                return View();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        public IActionResult Google(string provider)
        {
            var redirectUrl = Url.Action("GoogleResponse", "Authentication");
            var properties = new AuthenticationProperties { RedirectUri = redirectUrl };
            return Challenge(properties, GoogleDefaults.AuthenticationScheme);
        }

        [HttpGet]
        public async Task<IActionResult> GoogleResponse()
        {
            var info = await HttpContext.AuthenticateAsync(GoogleDefaults.AuthenticationScheme);
            if (info == null)
            {
                return RedirectToAction("IndexSignIn");
            }

            var email = info.Principal.FindFirst(System.Security.Claims.ClaimTypes.Email)?.Value;
            var user = await _userAccountService.SearchUserFromServiceAsync(email);

            if (user == null)
            {
                var signUpUser = new SignUpUser
                {
                    Email = email,
                    FullName = info.Principal.FindFirstValue(ClaimTypes.Name),
                    Password = "Abc123@",
                    ConfirmPassword = "Abc123@"
                };
                user.FullName = signUpUser.FullName;
                await _userAccountService.SignUpUserFromServiceAsync(signUpUser);
            }

            await _userAccountService.SignInFromServiceAsync(new SignIn
            {
                Email = email,
                Password = "Abc123@"
            });
            // Lưu vào Session dưới dạng JSON
            HttpContext.Session.SetObject("UserInfo", user);
            return RedirectToAction("Index", "Book");
        }
    }
}
