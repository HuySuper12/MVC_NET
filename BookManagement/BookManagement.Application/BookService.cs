using BookManagement.Domain.Entities;
using BookManagement.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookManagement.Application
{
    public class BookService : IBookService
    {
        private readonly IBookRepository _bookRepository;

        public BookService(IBookRepository bookRepository)
        {
            _bookRepository = bookRepository;
        }

        public async Task<bool> AddBookFromServiceAsync(Book book)
        {
            var searchBook = await _bookRepository.GetBookByIdAsync(book.BookId);
            if(searchBook != null)
            {
                return false;
            }

            return await _bookRepository.AddBookAsync(book);
        }

        public async Task<bool> DeleteBookFromServiceAsync(int id)
        {
            var searchBook = await _bookRepository.GetBookByIdAsync(id);
            if (searchBook == null)
            {
                return false;
            }
            return await _bookRepository.DeleteBookAsync(searchBook);
        }

        public async Task<Book> GetBookByIdFromServiceAsync(int id)
        {
            return await _bookRepository.GetBookByIdAsync(id);
        }

        public async Task<List<Book>> GetBooksFromServiceAsync()
        {
            var list = await _bookRepository.GetBooksAsync();
            return list.ToList();
        }

        public async Task<bool> UpdateBookFromServiceAsync(Book book)
        {
            var searchBook = await _bookRepository.GetBookByIdAsync(book.BookId);
            if (searchBook == null)
            {
                return false;
            }
            return await _bookRepository.UpdateBookAsync(book);
        }
    }
}
