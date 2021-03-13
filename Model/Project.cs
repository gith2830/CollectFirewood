using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Project
    {
        public int Id { get; set; }
        public int ClassifyId { get; set; }
        public string ProjectName { get; set; }
        public ProjectState State { get; set; }
        public decimal Goal { get; set; }
        public DateTime Deadline { get; set; }
        public int LikeCount { get; set; }
        public string Content { get; set; }
        public string CoverImg { get; set; }
    }
}
