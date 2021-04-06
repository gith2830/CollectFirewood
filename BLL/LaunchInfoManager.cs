using System;
using DAL;
using Model;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class LaunchInfoManager:ManagerBase<LaunchInfo>
    {
        DAL.LaunchInfoService dal = new DAL.LaunchInfoService();
        public LaunchInfoManager()
        {
            base.Dal = dal;
        }
        public int Launch(LaunchInfo launchInfo)
        {
            LaunchInfoService launchInfoService = new LaunchInfoService();
            return launchInfoService.Launch(launchInfo);
        }

        public bool DeleteByUserId(int id)
        {
            Dictionary<string, object> dic = new Dictionary<string, object>();
            dic.Add(nameof(Model.LaunchInfo.UserId), id);
            return dal.Delete(dic)>0;
        }
    }
}
