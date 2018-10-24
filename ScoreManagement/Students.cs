using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScoreManagement
{
    class Students : Dictionary<string, Student>
    {
        public void GetAll()
        {
            Database.Load();
            DataTableReader dtReader = Database.dsStudent.Tables["info"].CreateDataReader();
            while ( dtReader.Read() ) {
                String id = dtReader.GetString(0);
                String firstName = dtReader.GetString(1);
                String lastName = dtReader.GetString(2);
                DateTime birthday = dtReader.GetDateTime(3);
                char sex = char.Parse(dtReader.GetString(4));
                String major = dtReader.GetString(5);
                Double average = 0;
                //get scores list
                List<Score> scores = new List<Score>();
                DataTableReader dtReader2 = Database.dsStudent.Tables["scores"].CreateDataReader();
                while ( dtReader2.Read() ) {
                    if ( dtReader2.GetString(0).Equals(id) ) {
                        String course_id = dtReader2.GetString(1);
                        String course_name = dtReader2.GetString(2);
                        double first_mark = dtReader2.GetDouble(3);
                        double second_mark = dtReader2.GetDouble(4);
                        double course_average = (first_mark + second_mark) / 2;
                        scores.Add(new Score(course_id, course_name, first_mark, second_mark, course_average));
                    }
                }
                //calculate average
                int count = 0;
                dtReader2 = Database.dsStudent.Tables["scores"].CreateDataReader();
                while ( dtReader2.Read() ) {
                    if ( dtReader2.GetString(0).Equals(id) ) {
                        count += 2;
                        double first_mark = dtReader2.GetDouble(3);
                        double second_mark = dtReader2.GetDouble(4);
                        average += first_mark + second_mark;
                    }
                }
                average /= count;
                this.Add(id, (new Student(scores, id, firstName, lastName, major, average, birthday, sex)));
            }
            dtReader.Close();
        }
    }
}
