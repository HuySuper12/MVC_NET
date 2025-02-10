using BookManagement.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookManagement.Infrastructure
{
    public interface IBookRepository
    {
        public Task<IEnumerable<Book>> GetBooksAsync();
        public Task<Book> GetBookByIdAsync(int id);
        public Task<bool> AddBookAsync(Book book);
        public Task<bool> UpdateBookAsync(Book book);
        public Task<bool> DeleteBookAsync(Book book);
    }
}
