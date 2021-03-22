using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    // BLL层接口
    public interface IManagerBase<T>
    {
        /// <summary>
        /// 获取model总数
        /// </summary>
        /// <returns></returns>
        int GetModelCount();

        /// <summary>
        /// 获取model模型
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        T GetModel(int id);

        /// <summary>
        /// 分页获取model集合
        /// </summary>
        /// <param name="pageIndex">页数</param>
        /// <param name="pageSize">页行数</param>
        /// <returns></returns>
        List<T> GetPageList(int pageIndex, int pageSize);

        /// <summary>
        /// 添加model
        /// </summary>
        /// <param name="admin">model模型</param>
        /// <returns></returns>
        bool Add(T model);

        /// <summary>
        /// 删除model
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        bool Delete(int id);

        /// <summary>
        /// 修改model
        /// </summary>
        /// <param name="model">model模型</param>
        /// <returns></returns>
        bool Update(T model);
    }
}
