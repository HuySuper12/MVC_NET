using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;

namespace BookManagement.Domain.Entities;

public partial class UserAccount : IdentityUser
{
    //public int MemberId { get; set; }

    //public string Password { get; set; } = null!;

    //public string Email { get; set; } = null!;

    public string FullName { get; set; } = null!;

    //public int Role { get; set; }
}
