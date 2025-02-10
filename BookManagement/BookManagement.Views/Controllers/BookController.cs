using BookManagement.Application;
using BookManagement.Domain.Entities;
using BookManagement.Views.Models;
using Microsoft.AspNetCore.Mvc;

namespace BookManagement.Views.Controllers
{
    public class BookController : Controller
    {
        private readonly IBookService _bookService;
        private readonly IBookCategoryService _bookCategoryService;

        public BookController(IBookService bookService, IBookCategoryService bookCategoryService)
        {
            _bookService = bookService;
            _bookCategoryService = bookCategoryService;
        }

        public async Task<IActionResult> Index()
        {
            try
            {
                BookManagementModel model = new BookManagementModel();

                if (TempData["Search"] != null)
                {
                    var list = await _bookService.GetBooksFromServiceAsync();
                    model.Books = list.FindAll(x => x.BookName.ToLower().Contains(TempData["Search"].ToString().ToLower()));
                }
                else
                {
                    model.Books = await _bookService.GetBooksFromServiceAsync();
                }

                ViewData["Title"] = "Book Management";
                return View("BookManagement", model);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);

            }
        }

        public async Task<IActionResult> BookDetail(int id)
        {
            try
            {
                var book = await _bookService.GetBookByIdFromServiceAsync(id);

                if (book == null)
                {
                    return NotFound();
                }

                return new JsonResult(new
                {
                    id = book.BookId,
                    title = book.BookName,
                    author = book.Author,
                    publishedDate = book.PublicationDate,
                    price = book.Price,
                    description = book.Description,
                    categoryId = book.BookCategoryId,
                    quantity = book.Quantity
                });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        public async Task<IActionResult> BookCategory()
        {
            try
            {
                var bookCategories = await _bookCategoryService.GetBookCategoriesFromServiceAsync();
                return new JsonResult(bookCategories);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }      
        }

        public async Task<IActionResult> DeleteBook(int id)
        {
            try
            {
                var book = await _bookService.GetBookByIdFromServiceAsync(id);

                if (book == null)
                {
                    return BadRequest("Not found book");
                }

                await _bookService.DeleteBookFromServiceAsync(id);
                TempData["Success"] = "Delete book successfully";
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    
        public async Task<IActionResult> AddOrUpdateBook(Book book, string title)
        {
            try
            {
                if (title == "Add")
                {
                    var result = await _bookService.GetBookByIdFromServiceAsync(book.BookId);
                    if (result == null)
                    {
                        await _bookService.AddBookFromServiceAsync(book);
                        TempData["Success"] = "Add new book successfully!";
                    }
                }
                else
                {
                    var result = await _bookService.GetBookByIdFromServiceAsync(book.BookId);
                    if (result != null)
                    {
                        await _bookService.UpdateBookFromServiceAsync(book);
                        TempData["Success"] = "Update book successfully";
                    }
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        public async Task<IActionResult> SearchTitle(string search)
        {
            try
            {
                //Set Search vao TempData
                TempData["Search"] = search;
                return RedirectToAction("Index");
            }
            catch (Exception ex) 
            { 
                return BadRequest(ex.Message); 
            }
        }
    }
}
