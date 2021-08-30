using System;
using System.Collections.Generic;

#nullable disable

namespace Project.Models
{
    public partial class TermStudent
    {
        public int TermId { get; set; }
        public string StudentId { get; set; }

        public virtual Student Student { get; set; }
        public virtual Term Term { get; set; }
    }
}
