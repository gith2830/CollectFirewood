using Model;
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

        /// <summary>
        /// 修改项目进度
        /// </summary>
        /// <param name="projectId">项目id</param>
        /// <param name="state">项目状态</param>
        /// <returns></returns>
        public bool ChangeProjectState(int projectId, ProjectState state)
        {
            Model.Project project = dal.GetModel(projectId);
            project.State = state;
            if (dal.Update(project)>0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 给项目捐钱
        /// </summary>
        /// <param name="userId">用户id</param>
        /// <param name="projectId">项目id</param>
        /// <param name="money">捐赠金额</param>
        /// <returns></returns>
        public bool AddProejctMoney(int userId,int projectId,decimal money)
        {
            return dal.AddProjectMoney(userId, projectId, money) > 0;
        }
    }
}
