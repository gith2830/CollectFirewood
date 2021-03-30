using System;
using DAL;
using Model;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class LaunchInfoManager
    {
        public int Launch(LaunchInfo launchInfo)
        {
            LaunchInfoService launchInfoService = new LaunchInfoService();
            return launchInfoService.Launch(launchInfo);
        }
    }
}
