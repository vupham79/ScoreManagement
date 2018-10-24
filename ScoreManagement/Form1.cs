using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ScoreManagement
{
    public partial class Form1 : Form
    {
        Students listOfStudents = new Students();
        public Form1()
        {
            InitializeComponent();
            LoadStudentID();
        }
        private void cbbID_SelectedIndexChanged(object sender, EventArgs e)
        {
            try {
                Student student = listOfStudents[cbbID.SelectedItem.ToString()];
                txtFirstname.Text = student.FirstName;
                txtLastname.Text = student.LastName;
                txtMajor.Text = student.Major;
                txtSex.Text = student.Sex.ToString();
                txtBirthday.Text = student.Birthday.ToShortDateString();
                txtAverage.Text = student.Average.ToString();
                dgvScore.DataSource = student.listOfScore;
            } catch {
                MessageBox.Show("Student ID not found!");
            }
        }
        private void btnSearch_Click(object sender, EventArgs e)
        {
            try {
                Student student = listOfStudents[cbbID.SelectedItem.ToString()];
                List<Score> result = new List<Score>();
                foreach ( Score score in student.listOfScore ) {
                    if ( score.Course_id.ToUpper().Contains(txtCourseID.Text.ToUpper()) ) {
                        result.Add(score);
                    }
                }
                dgvScore.DataSource = result;
            } catch {
                MessageBox.Show("Student ID not found!");
            }
        }
        public void LoadStudentID()
        {
            listOfStudents.GetAll();
            foreach ( KeyValuePair<String, Student> pair in listOfStudents ) {
                cbbID.Items.Add(pair.Key);
            }
        }
    }
}
