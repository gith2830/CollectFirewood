using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Comment
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int ProjectId { get; set; }
        public string Content { get; set; }
        public string SendTime { get; set; }
        //联表
        public string Nickname { get; set; }
        public string UserPic { get; set; }
    }
}
