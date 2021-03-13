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
        public bool Add(Model model)
        {
            return Dal.Add(model)>0;
        }

        public bool Delete(int id)
        {
            return Dal.Delete(id)>0;
        }

        public Model GetModel(int id)
        {
            return Dal.GetModel(id);
        }

        public int GetModelCount()
        {
            return Dal.GetModelCount();
        }

        public List<Model> GetPageList(int pageIndex, int pageSize)
        {
            int start = (pageIndex - 1) * pageSize + 1;
            int end = start + pageSize-1;
            return Dal.GetPageList(start, end);
        }

        public bool Update(Model model)
        {
            return Dal.Update(model) > 0;
        }
    }
}
