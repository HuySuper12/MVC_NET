using BookManagement.Domain.ObjectValues;

namespace BookManagement.Views.Models
{
    public class AuthenticationModel
    {
        public SignUpUser SignUpUser { get; set; } = new SignUpUser();
        public SignIn SignIn { get; set; } = new SignIn();
    }
}
