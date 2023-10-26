using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampathWeek5CodingAssessment
{
    public class Rectangle : Shape
    {
        private double length;
        private double width;
        public Rectangle(double l, double w)
        {
            this.length = l;
            this.width = w;
        }
        public override double GetArea()
        {
            return length * width;
        }
        public override double GetPerimeter()
        {
            return 2 * (length + width);
        }
    }

}
