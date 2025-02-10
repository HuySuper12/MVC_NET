using BookManagement.Domain;
using BookManagement.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookManagement.Infrastructure
{
    public class BookRepository : IBookRepository
    {
        private BookManagementDbContext _context;

        public async Task<bool> AddBookAsync(Book book)
        {
            _context = new BookManagementDbContext();
            _context.Books.Add(book);
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> DeleteBookAsync(Book book)
        {
            _context = new BookManagementDbContext();
            _context.Books.Remove(book);
            await _context.SaveChangesAsync();
            return true;
        }

        public Task<Book> GetBookByIdAsync(int id)
        {
            _context = new BookManagementDbContext();
            return _context.Books.Include("BookCategory").FirstOrDefaultAsync(b => b.BookId == id);
        }
    

        public async Task<IEnumerable<Book>> GetBooksAsync() 
        {
            _context = new BookManagementDbContext();
            return await _context.Books.Include("BookCategory").ToListAsync();
        } 


        public async Task<bool> UpdateBookAsync(Book book)
        {
            _context = new BookManagementDbContext();
            _context.Books.Update(book);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
