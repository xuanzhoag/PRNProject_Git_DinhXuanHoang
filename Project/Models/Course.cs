using System;
using System.Collections.Generic;

#nullable disable

namespace Project.Models
{
    public partial class Course
    {
        public Course()
        {
            Marks = new HashSet<Mark>();
        }

        public int CourseId { get; set; }
        public string StudentId { get; set; }
        public string SubjectId { get; set; }
        public string TermId { get; set; }
        public string SubjectName { get; set; }

        public virtual Student Student { get; set; }
        public virtual ICollection<Mark> Marks { get; set; }
    }
}
