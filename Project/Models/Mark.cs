using System;
using System.Collections.Generic;

#nullable disable

namespace Project.Models
{
    public partial class Mark
    {
        public string MarkId { get; set; }
        public string MarkType { get; set; }
        public string MarkWeight { get; set; }
        public int CourseId { get; set; }
        public string MarkName { get; set; }
        public double Value { get; set; }

        public virtual Course Course { get; set; }
    }
}
