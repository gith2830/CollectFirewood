using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class LikeManager: ManagerBase<Model.Like>
    {
        private DAL.LikeService dal = new DAL.LikeService();
        public LikeManager()
        {
            base.Dal = dal;
        }
    }
}
