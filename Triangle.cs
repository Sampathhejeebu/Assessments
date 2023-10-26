using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampathWeek5CodingAssessment
{
    public class Triangle : Shape
    {
        private double side1;
        private double side2;
        private double side3;
        public Triangle(double s1, double s2, double s3)
        {
            this.side1 = s1;
            this.side2 = s2;
            this.side3 = s3;
        }
        public override double GetArea()
        {
            double s = (side1 + side2 + side3) / 2;
            return Math.Sqrt(s * (s - side1) * (s - side2) * (s - side3));
        }
        public override double GetPerimeter()
        {
            return side1 + side2 + side3;
        }
    }
}
