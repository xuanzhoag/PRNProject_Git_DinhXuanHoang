using System;
using System.Collections.Generic;

#nullable disable

namespace Project.Models
{
    public partial class Transcript
    {
        public int TermId { get; set; }
        public string StudentId { get; set; }
        public string SubjectId { get; set; }
        public string SubjectName { get; set; }
        public string SubjectPreQuisite { get; set; }
        public int Credit { get; set; }
        public double Grade { get; set; }
        public string Status { get; set; }

        public virtual Term Term { get; set; }
    }
}
