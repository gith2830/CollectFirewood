using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ClassifyManager:ManagerBase<Model.Classify>
    {
        private DAL.ClassifyService dal = new DAL.ClassifyService();
        public ClassifyManager()
        {
            base.Dal = dal;
        }
        public List<Model.Classify> GetAllList()
        {
            return dal.GetAllList();
        }
    }
}
