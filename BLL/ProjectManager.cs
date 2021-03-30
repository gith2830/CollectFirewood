using DAL;
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

        public override List<Project> GetPageList(int pageIndex, int pageSize)
        {
            int start = (pageIndex - 1) * pageSize + 1;
            int end = start + pageSize - 1;
            return dal.GetPageList(start, end);
        }

        /// <summary>
        /// 分页获取还在进行众筹的项目集合
        /// </summary>
        /// <param name="pageIndex">页数</param>
        /// <param name="pageSize">页行数</param>
        /// <returns></returns>
        public List<Project> GetPageListForInProgress(int pageIndex,int pageSize,int? classifyId)
        {
            int start = (pageIndex - 1) * pageSize + 1;
            int end = start + pageSize - 1;
            Dictionary<string, object> wheres = new Dictionary<string, object>();
            wheres.Add(nameof(Model.Project.State), Model.ProjectState.InProgress);
            List<string> orderBy = new List<string>();
            if (classifyId!=null&&classifyId > 0)
            {
                orderBy.Add("classifyId");
            }
            return dal.GetPageListWhereToAndOrderBy(start, end, wheres, orderBy);
        }

        /// <summary>
        /// 分页获取还在进行众筹的项目集合
        /// </summary>
        /// <param name="pageIndex">页数</param>
        /// <param name="pageSize">页行数</param>
        /// <returns></returns>
        public List<Project> GetPageListForExamine(int pageIndex,int pageSize,int? classifyId)
        {
            int start = (pageIndex - 1) * pageSize + 1;
            int end = start + pageSize - 1;
            Dictionary<string, object> wheres = new Dictionary<string, object>();
            wheres.Add(nameof(Model.Project.PublishState), Model.PublishState.Examine);
            List<string> orderBy = new List<string>();
            if (classifyId!=null&&classifyId > 0)
            {
                orderBy.Add("classifyId");
            }
            return dal.GetPageListWhereToAndOrderBy(start, end, wheres, orderBy);
        }

        /// <summary>
        /// 分页获取已经完成的众筹项目集合
        /// </summary>
        /// <param name="pageIndex">页数</param>
        /// <param name="pageSize">页行数</param>
        /// <returns></returns>
        public List<Project> GetPageListForFinish(int pageIndex,int pageSize, int classifyId)
        {
            int start = (pageIndex - 1) * pageSize + 1;
            int end = start + pageSize - 1;
            Dictionary<string, object> wheres = new Dictionary<string, object>();
            wheres.Add(nameof(Model.Project.State), Model.ProjectState.Finish);
            Dictionary<string, object> orderBy = new Dictionary<string, object>();
            orderBy.Add("classifyId", classifyId);
            return dal.GetPageListWhereToAndOrderBy(start, end, wheres,null);
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
        /// 修改项目发布状态
        /// </summary>
        /// <param name="projectId">项目id</param>
        /// <param name="state">项目状态</param>
        /// <returns></returns>
        public bool ChangeProjectState(int projectId, PublishState state)
        {
            Model.Project project = dal.GetModel(projectId);
            project.PublishState = state;
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

        /// <summary>
        /// 分页获取已经完成的众筹项目集合
        /// </summary>
        /// <param name="pageIndex">页数</param>
        /// <param name="pageSize">页行数</param>
        /// <returns></returns>
        public List<Project> GetPageListForState(int pageIndex, int pageSize, int classifyId,ProjectState state)
        {
            int start = (pageIndex - 1) * pageSize + 1;
            int end = start + pageSize - 1;
            Dictionary<string, object> wheres = new Dictionary<string, object>();
            if (state!=ProjectState.Null)
            {
                wheres.Add(nameof(Model.Project.State), state);
            }
            if (classifyId>0)
            {
                wheres.Add(nameof(Model.Project.ClassifyId), classifyId);
            }
            return dal.GetPageListWhereToAndOrderBy(start, end, wheres, null);
        }


        /// <summary>
        /// 获取总页数
        /// </summary>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public int GetPageCount(int pageSize)
        {
            int projectCount = dal.GetModelCount();
            int pageCount = Convert.ToInt32(Math.Ceiling((double)projectCount / pageSize));
            return pageCount;
        }

        /// <summary>
        /// 获取某个分类和状态下总页数
        /// </summary>
        /// <param name="state"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public int GetPageCount(int classifyId, ProjectState? state, int pageSize)
        {
            int projectCount = dal.GetModelCount(classifyId, state);
            int pageCount = Convert.ToInt32(Math.Ceiling((double)projectCount / pageSize));
            return pageCount;
        }

        public List<Project> GetModelByClassifyId(int classifyid)
        {
            ProjectService projectService = new ProjectService();
            return projectService.GetModelByClassifyId(classifyid);
        }

        public List<Project> GetModelByState(int state)
        {
            ProjectService projectService = new ProjectService();
            return projectService.GetModelByState(state);
        }
        public List<Project> GetModelByAll()
        {
            ProjectService projectService = new ProjectService();
            return projectService.GetModelByAll();
        }
        public List<Project> GetModelById(int id)
        {
            ProjectService projectService = new ProjectService();
            return projectService.GetModelById(id);
        }
        public List<Project> GetModelByIdTest(int id)
        {
            ProjectService projectService = new ProjectService();
            return projectService.GetModelByIdTest(id);
        }
        public List<Project> GetModelByIdAndState(int id, int State)
        {
            ProjectService projectService = new ProjectService();
            return projectService.GetModelByIdAndState(id, State);

        }
        /// <summary>
        /// 获取某个分类和状态下总页数
        /// </summary>
        /// <param name="state"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public int GetPageCount(int classifyId, PublishState? state,int pageSize)
        {
            int projectCount = dal.GetModelCount(classifyId, state);
            int pageCount = Convert.ToInt32(Math.Ceiling((double)projectCount / pageSize));
            return pageCount;

        }
        public int ProjectLaunch(Project project)
        {
            ProjectService projectService = new ProjectService();
            return projectService.ProjectLaunch(project);
        }
        public Project GetProjectLaunchId(int UserId)
        {
            ProjectService projectService = new ProjectService();
            return projectService.GetProjectLaunchId(UserId);
        }
        public Project GetModelByPublishState(int UserId)
        {
            ProjectService projectService = new ProjectService();
            return projectService.GetModelByPublishState(UserId);
        }
    }
}
