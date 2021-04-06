using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ClassifyManager:ManagerBase<Model.Classify>
    {
        // dal接口 调用执行dal层的方法
        private DAL.ClassifyService dal = new DAL.ClassifyService();
        public ClassifyManager()
        {
            //传入父类初始化接口
            base.Dal = dal;
        }
        /// <summary>
        /// 获得所有的分类
        /// </summary>
        /// <returns></returns>
        public List<Model.Classify> GetAllList()
        {
            return dal.GetAllList();
        }
        public override bool Delete(int id)
        {
            ProjectManager projectManager = new ProjectManager();
            projectManager.DeleteByClassifyId(id);
            return dal.Delete(id)>0;
        }
    }
}
