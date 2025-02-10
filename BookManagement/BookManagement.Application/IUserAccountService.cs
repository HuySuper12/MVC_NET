using BookManagement.Domain.Entities;
using BookManagement.Domain.ObjectValues;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace BookManagement.Application
{
    public interface IUserAccountService
    {
        public Task<bool> SignInFromServiceAsync(SignIn signIn);
        public Task SignOutFromServiceAsync();
        public Task<IdentityResult> SignUpUserFromServiceAsync(SignUpUser signUpUser);
        public Task<IdentityResult> SignUpStaffFromServiceAsync(SignUpUser signUpUser);
        public Task<UserAccount> SearchUserFromServiceAsync(string email);
    }
}
