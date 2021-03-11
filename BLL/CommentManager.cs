using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class CommentManager:ManagerBase<Model.Comment>
    {
        public CommentManager()
        {
            base.Dal = new DAL.CommentService();
        }
    }
}
