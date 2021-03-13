using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ProjectManager:ManagerBase<Model.Project>
    {
        // dal接口 调用执行dal层的方法
        DAL.ProjectService dal = new DAL.ProjectService();
        public ProjectManager()
        {
            //传入父类初始化接口
            base.Dal = dal;
        }
    }
}
