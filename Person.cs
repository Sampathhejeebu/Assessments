using System;

namespace SampathWeek5CodingAssessment
{
    public class Person
    {
        private string name;
        private int age;
        private string address;

        // Constructor
        public Person(string name, int age, string address)
        {
            this.name = name;
            this.age = age;
            this.address = address;
        }

        public string Name
        {
            get
            { return name; 
            }
            set 
            {
                name = value; 
            }
        }

        public int Age
        {
            get 
            { 
                return age;
            }
            set
            { 
                age = value;
            }
        }

        public string Address
        {
            get 
            { 
                return address;
            }
            set
            { 
                address = value;
            }
        }
        // Define interfaces for different roles.
         interface IDriver
        {
            void Drive();
        }
        
         interface IStudent
        {
            void Study();
        }

         interface IEmployee
        {
            void Work();
        }

        // Create a class that inherits from "Person" and implements multiple interfaces.
        public class DifferentRolesPerson : Person, IDriver, IStudent, IEmployee
        {
            public DifferentRolesPerson(string name, int age, string address) : base(name, age, address)
            {
               
            }         
                    
            public void Drive()
            {
                Console.WriteLine(Name + " is driving.");
            }

            public void Study()
            {
                Console.WriteLine(Name + " is studying.");
            }

            public void Work()
            {
                Console.WriteLine(Name + " is working.");
            }
        }
    }
}
