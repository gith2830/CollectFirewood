using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class SupportProjectManager:ManagerBase<Model.SupportProject>
    {
        public SupportProjectManager()
        {
            base.Dal = new DAL.SupportProjectService();
        }
    }
}
