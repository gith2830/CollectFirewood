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
        public Model.Likes GetModelByUserIdAndProjectId(int UserId,int ProjectId)
        {
            LikesService likesService = new LikesService();
            return likesService.GetModelByUserIdAndProjectId(UserId, ProjectId);
        }
        public int Insert(int UserId, int ProjectId)
        {
            LikesService likesService=new LikesService();
            return likesService.Insert(UserId, ProjectId);
        }
        public int Delete(int UserId, int ProjectId)
        {
            LikesService likesService = new LikesService();
            return likesService.Delete(UserId, ProjectId);
        }
    }
}
