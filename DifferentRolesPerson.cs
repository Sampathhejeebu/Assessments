using System;

namespace SampathWeek5CodingAssessment
{
    internal class DifferentRolesPerson : Person, IDriver, IStudent, IEmployee
    {
        public DifferentRolesPerson(string name, int age, string address)
            : base(name, age, address)
        {
           
        }

        public void Drive()
        {
            Console.WriteLine($"{Name} is a driver.");
        }

        public void Study()
        {
            Console.WriteLine($"{Name} is a student.");
        }

        public void Work()
        {
            Console.WriteLine($"{Name} is an employee.");
        }
    }

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
}
