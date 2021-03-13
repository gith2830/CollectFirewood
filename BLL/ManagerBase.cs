using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    // BLL层接口实现类
    public class ManagerBase<Model>: IManagerBase<Model>
    {
        protected DAL.IServiceBase<Model> Dal { get; set; }
        public virtual bool Add(Model model)
        {
            return Dal.Add(model)>0;
        }

        public virtual bool Delete(int id)
        {
            return Dal.Delete(id)>0;
        }

        public virtual Model GetModel(int id)
        {
            return Dal.GetModel(id);
        }

        public virtual int GetModelCount()
        {
            return Dal.GetModelCount();
        }

        public virtual List<Model> GetPageList(int pageIndex, int pageSize)
        {
            int start = (pageIndex - 1) * pageSize + 1;
            int end = start + pageSize-1;
            return Dal.GetPageList(start, end);
        }

        public virtual bool Update(Model model)
        {
            return Dal.Update(model) > 0;
        }
    }
}
