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
    }
}
