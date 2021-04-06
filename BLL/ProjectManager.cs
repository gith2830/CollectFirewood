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

        public List<Project> GetPageList(int pageIndex, int pageSize,string keyword)
        {
            int start = (pageIndex - 1) * pageSize + 1;
            int end = start + pageSize - 1;
            return dal.GetPageList(start, end,keyword);
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
            return dal.GetPageListWhereToAndOrderByCheckState(start, end, wheres, orderBy);
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
            return dal.GetPageListWhereToAndOrderByCheckState(start, end, wheres,null);
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
            List<string> orderList = new List<string>();
            orderList.Add("id desc");
            return dal.GetPageListWhereToAndOrderByCheckState(start, end, wheres, orderList);
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
            return dal.GetModelByClassifyId(classifyid);
        }

        public List<Project> GetModelByState(int state)
        {
            return dal.GetModelByState(state);
        }
        public List<Project> GetModelByAll()
        {
            return dal.GetModelByAll();
        }
        public List<Project> GetModelById(int id)
        {
            return dal.GetModelById(id);
        }
        public List<Project> GetModelByIdTest(int id)
        {
            return dal.GetModelByIdTest(id);
        }
        public List<Project> GetModelByIdAndState(int id, int State)
        {
            return dal.GetModelByIdAndState(id, State);

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
            return dal.ProjectLaunch(project);
        }
        public Project GetProjectLaunchId(int UserId)
        {
            return dal.GetProjectLaunchId(UserId);
        }
        public Project GetModelByPublishState(int UserId)
        {
            return dal.GetModelByPublishState(UserId);
        }

        /// <summary>
        /// 删除分类id下所有的项目
        /// </summary>
        /// <param name="classifyId">分类id</param>
        /// <returns></returns>
        public bool DeleteByClassifyId(int classifyId)
        {
            Dictionary<string, object> dic = new Dictionary<string, object>();
            dic.Add(nameof(Model.Project.ClassifyId), classifyId);
            return dal.Delete(dic)>0;
        }
        public List<Project> GetProjectUserLikes(int UserId)
        {
            ProjectService projectService = new ProjectService();
            return projectService.GetProjectUserLikes(UserId);
        }
        public List<Project> GetProjectUserSupport(int UserId)
        {
            ProjectService projectService = new ProjectService();
            return projectService.GetProjectUserSupport(UserId);
        }
        public List<Project> GetProjectUserLaunch(int UserId)
        {
            ProjectService projectService = new ProjectService();
            return projectService.GetProjectUserLaunch(UserId);
        }
        public void OverDate()
        {
            ProjectService projectService = new ProjectService();
            projectService.OverDate();

        }
        public List<Project> RetuenMoney(int Userid)
        {
            ProjectService projectService = new ProjectService();
            return projectService.RetuenMoney(Userid);
        }


        public bool DeleteByUserId(int userId)
        {
            var supportProjectManager = new SupportProjectManager();
            var likesManager = new LikesManager();
            Dictionary<string, object> spmDic = new Dictionary<string, object>();
            spmDic.Add(nameof(Model.Project.OwnerId), userId);
            int projectCount = dal.GetModelCount(spmDic);
            int pageSize = 20;
            int pageCount = Convert.ToInt32(Math.Ceiling((double)projectCount / pageSize));
            for (int i = 1; i <= pageCount; i++)
            {
                int start = (i - 1) * pageSize + 1;
                int end = start + pageSize - 1;
                var list = dal.GetPageListWhereToAndOrderByCheckState(start, end, spmDic, null);
                foreach (var item in list)
                {
                    supportProjectManager.DeleteByProjectId(item.Id);
                    likesManager.DeleteByProjectId(item.Id);
                }
            }
            Dictionary<string, object> dic = new Dictionary<string, object>();
            dic.Add(nameof(Model.Project.OwnerId), userId);
            return dal.Delete(dic) > 0;
        }
    }
}
