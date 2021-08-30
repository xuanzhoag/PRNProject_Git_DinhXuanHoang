using System;
using System.Collections.Generic;

#nullable disable

namespace Project.Models
{
    public partial class Student
    {
        public Student()
        {
            Courses = new HashSet<Course>();
            TermStudents = new HashSet<TermStudent>();
        }

        public string StudentId { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public DateTime? Birth { get; set; }
        public string Phone { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }

        public virtual ICollection<Course> Courses { get; set; }
        public virtual ICollection<TermStudent> TermStudents { get; set; }
    }
}
