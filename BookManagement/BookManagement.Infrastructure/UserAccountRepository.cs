using BookManagement.Domain.Entities;
using BookManagement.Domain;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BookManagement.Domain.ObjectValues;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http;
using System.Security.Claims;

namespace BookManagement.Infrastructure
{
    public class UserAccountRepository : IUserAccountRepository
    {
        private BookManagementDbContext _context;

        private readonly UserManager<UserAccount> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly SignInManager<UserAccount> _signInManager;

        public UserAccountRepository(UserManager<UserAccount> userManager, RoleManager<IdentityRole> roleManager, SignInManager<UserAccount> signInManager)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _signInManager = signInManager;
        }

        public async Task<bool> SignInAsync(SignIn signIn)
        {
            var user = await _userManager.FindByEmailAsync(signIn.Email);
            var password = await _userManager.CheckPasswordAsync(user, signIn.Password);

            if(user == null || !password)
            {
                return false;
            }

            var result = await _signInManager.PasswordSignInAsync(user, signIn.Password, true, false);
            if (result.Succeeded)
            {
                return true;
            }

            return false;
        }

        public async Task SignOutAsync()
        {
            await _signInManager.SignOutAsync(); // Xóa Cookie Identity
        }

        public async Task<IdentityResult> SignUpUserAsync(SignUpUser signUpUser)
        {
            _context = new BookManagementDbContext();

            var user = new UserAccount
            {
                UserName = signUpUser.Email,
                Email = signUpUser.Email,
                FullName = signUpUser.FullName,
                PhoneNumber = signUpUser.Phone
            };

            var result = await _userManager.CreateAsync(user, signUpUser.Password);

            if (result.Succeeded)
            {
                await _roleManager.CreateAsync(new IdentityRole("User"));
                await _userManager.AddToRoleAsync(user, "User");
            }

            return result;
        }

        public async Task<IdentityResult> SignUpStaffAsync(SignUpUser signUpUser)
        {
            _context = new BookManagementDbContext();

            var staff = new UserAccount
            {
                UserName = signUpUser.Email,
                Email = signUpUser.Email,
                FullName = signUpUser.FullName,
                PhoneNumber = signUpUser.Phone
            };

            var result = await _userManager.CreateAsync(staff, signUpUser.Password);

            if (result.Succeeded)
            {
                await _roleManager.CreateAsync(new IdentityRole("Staff"));
                await _userManager.AddToRoleAsync(staff, "Staff");
            }

            return result;
        }

        public async Task<UserAccount> SearchUserAsync(string email)
        {
            _context = new BookManagementDbContext();
            return await _context.UserAccounts.FirstOrDefaultAsync(x => x.Email == email);
        }
    }
}
