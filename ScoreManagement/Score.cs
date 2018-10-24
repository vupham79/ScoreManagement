using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScoreManagement
{
    class Score
    {
        private String course_id, course_name;
        private double first_mark, second_mark, average;
        public Score(string course_id, string course_name, double first_mark, double second_mark, double average)
        {
            this.course_id = course_id;
            this.course_name = course_name;
            this.first_mark = first_mark;
            this.second_mark = second_mark;
            this.average = average;
        }
        public string Course_id { get => course_id; set => course_id = value; }
        public string Course_name { get => course_name; set => course_name = value; }
        public double First_mark { get => first_mark; set => first_mark = value; }
        public double Second_mark { get => second_mark; set => second_mark = value; }
        public double Average { get => average; set => average = value; }
    }
}
