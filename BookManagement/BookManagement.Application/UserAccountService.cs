using BookManagement.Domain.Entities;
using BookManagement.Domain.ObjectValues;
using BookManagement.Infrastructure;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace BookManagement.Application
{
    public class UserAccountService : IUserAccountService
    {
        private readonly IUserAccountRepository _userAccountRepository;

        public UserAccountService(IUserAccountRepository userAccountRepository)
        {
            _userAccountRepository = userAccountRepository;
        }

        public async Task SignOutFromServiceAsync()
        {
            await _userAccountRepository.SignOutAsync();
        }

        public async Task<bool> SignInFromServiceAsync(SignIn signIn)
        {
            return await _userAccountRepository.SignInAsync(signIn);
        }

        public async Task<IdentityResult> SignUpStaffFromServiceAsync(SignUpUser signUpUser)
        {
            return await _userAccountRepository.SignUpStaffAsync(signUpUser);
        }

        public async Task<IdentityResult> SignUpUserFromServiceAsync(SignUpUser signUpUser)
        {
            return await _userAccountRepository.SignUpUserAsync(signUpUser);
        }

        public async Task<UserAccount> SearchUserFromServiceAsync(string email)
        {
            return await _userAccountRepository.SearchUserAsync(email);
        }
    }
}
