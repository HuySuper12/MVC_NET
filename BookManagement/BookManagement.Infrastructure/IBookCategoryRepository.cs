using BookManagement.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookManagement.Infrastructure
{
    public interface IBookCategoryRepository
    {
        public Task<IEnumerable<BookCategory>> GetBookCategoriesAsync();
    }
}
