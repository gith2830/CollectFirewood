using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class LaunchInfoService
    {
        public int Launch(LaunchInfo launchInfo)
        {
            string sql = $"INSERT INTO [dbo].[LaunchInfo]([UserId],[TrueName],[PhoneNumber],[BankName],[Branch],[BankCard],[Address])" +
                $"VALUES('{launchInfo.UserId}','{launchInfo.TrueName}','{launchInfo.PhoneNumber}','{launchInfo.BankName}','{launchInfo.Branch}','{launchInfo.BankCard}','{launchInfo.Address}')";
            return DbHelper.Update(sql);
        }
    }
}
