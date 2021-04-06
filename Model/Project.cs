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
        public decimal CurrentMoney { get; set; }
        public decimal Goal { get; set; }
        public DateTime Deadline { get; set; }
        public int LikeCount { get; set; }
        public string Content { get; set; }
        public string CoverImg { get; set; }
        public PublishState PublishState { get; set; }
        public int OwnerId { get; set; }
        public string Address { get; set; }
        public string Return { get; set; }
        public string ReturnMiddle { get; set; }
        public string ReturnMax { get; set; }
        public int ReturnTime { get; set; }
        public decimal Freight { get; set; }
        public string  Nickname { get; set; }

        public decimal Money { get; set; }
    }
}
