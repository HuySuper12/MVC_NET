using BookManagement.Domain.Entities;

namespace BookManagement.Views.Models
{
    public class BookManagementModel
    {
        public Book Book { get; set; }

        public List<Book> Books { get; set; }

        public List<BookCategory> BookCategories { get; set; }

    }
}
