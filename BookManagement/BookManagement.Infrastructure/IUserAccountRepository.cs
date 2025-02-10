using BookManagement.Domain;
using BookManagement.Domain.Entities;
using BookManagement.Domain.ObjectValues;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace BookManagement.Infrastructure
{
    public interface IUserAccountRepository
    {
        public Task<bool> SignInAsync(SignIn signIn);
        public Task SignOutAsync();
        public Task<IdentityResult> SignUpUserAsync(SignUpUser signUpUser);
        public Task<IdentityResult> SignUpStaffAsync(SignUpUser signUpUser);

        public Task<UserAccount> SearchUserAsync(string email);
    }
}
