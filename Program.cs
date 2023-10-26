using SampathWeek5CodingAssessment;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static SampathWeek5CodingAssessment.Person;

namespace SampathWeek5CodingAssessment
{
    internal class Program
    {
        static void Main(string[] args)
        {
            AreaAndPerimeter();
            GenaricMethod();
            Interface();

        }

        private static void Interface()
        {
            DifferentRolesPerson rolePlayer = new DifferentRolesPerson("Sampath", 21, "IT Hill-4 Rushikonda");


            rolePlayer.Drive();
            rolePlayer.Study();
            rolePlayer.Work();
        }

        private static void GenaricMethod()
        {
            Library library = new Library();

            Book book1 = new Book("Adventures of Tom Sawyer", "Mark Twain", "123");
            Book book2 = new Book("Ben Hur", "Lewis Wallace", "223");
            Book book3 = new Book("Time Machine", "H.G. Wells", "456");
            Book book4 = new Book("Anna Karenina", "Leo Tolstoy", "556");

            library.AddBook(book1);
            library.AddBook(book2);
            library.AddBook(book3);
            library.AddBook(book4);

            Console.WriteLine("Books in the library:");
            foreach (Book book in library.GetBooks())
            {
                Console.WriteLine(book.Title + " by " + book.Author);
            }

            library.RemoveBook(book2);
            Console.WriteLine("\nBooks in the library after removing " + book2.Title + ":");
            foreach (Book book in library.GetBooks())
            {
                Console.WriteLine(book.Title + " by " + book.Author);
            }
        }

        private static void AreaAndPerimeter()
        {
            Shape rectangle = new Rectangle(10, 12);
            Shape circle = new Circle(5);
            Shape triangle = new Triangle(7, 8, 6);

            // Calculate area and perimeter of each shape
            Console.WriteLine("\nArea and perimeter of various shapes:");
            Console.WriteLine("\nRectangle: Length-10, Width-12");
            Console.WriteLine("Area: " + rectangle.GetArea());
            Console.WriteLine("Perimeter: " + rectangle.GetPerimeter());

            Console.WriteLine("\nCircle: Radius-5");
            Console.WriteLine("Area: " + circle.GetArea());
            Console.WriteLine("Perimeter: " + circle.GetPerimeter());

            Console.WriteLine("\nTriangle: Side1-7, Side2-8, Side3-6");
            Console.WriteLine("Area: " + triangle.GetArea());
            Console.WriteLine("Perimeter: " + triangle.GetPerimeter());
        }
    }

}
