using System;

namespace SampathWeek5CodingAssessment
{
    public class Book
    {
        private string title;
        private string author;
        private string isdn; 

        public Book(string title, string author, string isdn)
        {
            this.title = title;
            this.author = author;
            this.isdn = isdn;
        }

        public string Title
        {
            get
            { 
                return title;
            }
            set
            { 
                title = value;
            }
        }

        public string Author
        {
            get
            {
                return author;
            }
            set 
            { 
                author = value;
            }
        }

        public string ISDN
        {
            get 
            { 
                return isdn;
            }
            set 
            {
                isdn = value;
            }
        }
    }

}
