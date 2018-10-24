using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScoreManagement
{
    class Database
    {
        public static DataSet dsStudent = new DataSet("StudentDB");
        public static SqlConnection cnObj = new SqlConnection(@"uid=sa;pwd=123;Initial Catalog=StudentManagement;Data Source=VUPHSE63200;Integrated Security=True");
        public static void Load()
        {
            SqlDataAdapter dAdapter = new SqlDataAdapter("SELECT student_id, firstname, lastname, birthday, sex, major FROM Student", cnObj);
            dAdapter.Fill(dsStudent, "info");
            dAdapter.SelectCommand = new SqlCommand("select Student.student_id, Course.course_id,course_name,first_mark, second_mark from Student " +
                "Inner JOIN Mark on Mark.student_id = Student.student_id " +
                "INNER JOIN Course on Course.course_id = Mark.course_id");
            dAdapter.SelectCommand.Connection = cnObj;
            dAdapter.Fill(dsStudent, "scores");
        }
    }
}
