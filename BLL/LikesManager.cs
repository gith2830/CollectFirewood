using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class LikesManager
    {
        LikesService dal = new LikesService();
        public Model.Likes GetModelByUserIdAndProjectId(int UserId,int ProjectId)
        {
            return dal.GetModelByUserIdAndProjectId(UserId, ProjectId);
        }
        public int Insert(int UserId, int ProjectId)
        {
            return dal.Insert(UserId, ProjectId);
        }
        public int Delete(int UserId, int ProjectId)
        {
            return dal.Delete(UserId, ProjectId);
        }
        public bool DeleteByUserId(int userId)
        {
            Dictionary<string, object> dic = new Dictionary<string, object>();
            dic.Add(nameof(Model.Likes.UserId), userId);
            return dal.Delete(dic) >0;
        }
        public bool DeleteByProjectId(int projectId)
        {
            Dictionary<string, object> dic = new Dictionary<string, object>();
            dic.Add(nameof(Model.Likes.ProjectId), projectId);
            return dal.Delete(dic) > 0;
        }
    }
}
