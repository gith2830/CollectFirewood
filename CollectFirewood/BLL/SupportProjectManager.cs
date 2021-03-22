using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class SupportProjectManager:ManagerBase<Model.SupportProject>
    {
        // dal接口 调用执行dal层的方法
        DAL.SupportProjectService dal = new DAL.SupportProjectService();
        public SupportProjectManager()
        {
            //传入父类初始化接口
            base.Dal = dal;
        }

        public bool DeleteAllByUserId(int userId)
        {
            return dal.DeleteAllByUserId(userId)>0;
        }
    }
}
