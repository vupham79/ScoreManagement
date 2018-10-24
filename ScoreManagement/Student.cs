using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScoreManagement
{
    class Student
    {
        public List<Score> listOfScore;
        private String id, firstName, lastName, major;
        private Double average;
        private DateTime birthday;
        private Char sex;
        public Student(string id, string firstName, string lastName, DateTime birthday, char sex, string major, Double average)
        {
            this.id = id;
            this.firstName = firstName;
            this.lastName = lastName;
            this.major = major;
            this.average = average;
            this.birthday = birthday;
            this.sex = sex;
            this.listOfScore = new List<Score>();
        }
        public Student()
        {
        }
        public Student(List<Score> listOfScore, string id, string firstName, string lastName, string major, Double average, DateTime birthday, char sex)
        {
            this.listOfScore = listOfScore;
            this.id = id;
            this.firstName = firstName;
            this.lastName = lastName;
            this.major = major;
            this.average = average;
            this.birthday = birthday;
            this.sex = sex;
        }
        public string Id { get => id; set => id = value; }
        public string FirstName { get => firstName; set => firstName = value; }
        public string LastName { get => lastName; set => lastName = value; }
        public string Major { get => major; set => major = value; }
        public DateTime Birthday { get => birthday; set => birthday = value; }
        public char Sex { get => sex; set => sex = value; }
        public Double Average { get => average; set => average = value; }
    }
}
