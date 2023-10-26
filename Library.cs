using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampathWeek5CodingAssessment
{
    internal class Library
    {
        private List<Book> books;
        public Library()
        {
            books = new List<Book>();
        }
        public void AddBook(Book book)
        {
            books.Add(book);
        }
        public void RemoveBook(Book book)
        {
            books.Remove(book);
        }
        public List<Book> GetBooks()
        {
            return books;
        }
    }
}
