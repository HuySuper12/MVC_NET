using BookManagement.Domain.Entities;
using BookManagement.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookManagement.Application
{
    public class BookCategoryService : IBookCategoryService
    {
        private IBookCategoryRepository _bookCategoryRepository;

        public BookCategoryService(IBookCategoryRepository bookCategoryRepository) { 
            _bookCategoryRepository = bookCategoryRepository;
        }

        public async Task<List<BookCategory>> GetBookCategoriesFromServiceAsync()
        {
            var list = await _bookCategoryRepository.GetBookCategoriesAsync();
            return list.ToList();
        }
    }
}
