using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class CommentManager:ManagerBase<Model.Comment>
    {
        // dal接口 调用执行dal层的方法
        DAL.CommentService dal = new DAL.CommentService();
        public CommentManager()
        {
            //传入父类初始化接口
            base.Dal = dal;
        }
    }
}
