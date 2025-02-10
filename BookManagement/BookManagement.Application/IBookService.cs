using BookManagement.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookManagement.Application
{
    public interface IBookService
    {
        public Task<List<Book>> GetBooksFromServiceAsync();
        public Task<Book> GetBookByIdFromServiceAsync(int id);
        public Task<bool> AddBookFromServiceAsync(Book book);
        public Task<bool> UpdateBookFromServiceAsync(Book book);
        public Task<bool> DeleteBookFromServiceAsync(int id);
    }
}
