using BookManagement.Domain;
using BookManagement.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace BookManagement.Infrastructure
{
    public class BookCategoryRepository : IBookCategoryRepository
    {
        private BookManagementDbContext _context;

        public BookCategoryRepository(BookManagementDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<BookCategory>> GetBookCategoriesAsync() => await _context.BookCategories.ToListAsync();

    }
}
