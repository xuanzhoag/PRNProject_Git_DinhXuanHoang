using System;
using System.Collections.Generic;

#nullable disable

namespace Project.Models
{
    public partial class Term
    {
        public Term()
        {
            TermStudents = new HashSet<TermStudent>();
        }

        public int TermId { get; set; }
        public string TermName { get; set; }

        public virtual ICollection<TermStudent> TermStudents { get; set; }
    }
}
