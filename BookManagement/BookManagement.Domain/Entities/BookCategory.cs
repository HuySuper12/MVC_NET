using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace BookManagement.Domain.Entities;

public partial class BookCategory
{
    public int BookCategoryId { get; set; }

    public string BookGenreType { get; set; } = null!;

    public string Description { get; set; } = null!;

    [JsonIgnore]  // Loại bỏ thuộc tính Books khỏi việc tuần tự hóa
    public virtual ICollection<Book> Books { get; set; } = new List<Book>();
}
