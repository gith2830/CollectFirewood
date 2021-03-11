using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public interface IServiceBase<T>
    {
        /// <summary>
        /// 获取model总数
        /// </summary>
        /// <returns></returns>
        int GetModelCount();

        /// <summary>
        /// 获取model
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        T GetModel(int id);

        /// <summary>
        /// 获取model集合
        /// </summary>
        /// <param name="start"></param>
        /// <param name="end"></param>
        /// <returns></returns>
        List<T> GetPageList(int start, int end);

        /// <summary>
        /// 添加model
        /// </summary>
        /// <param name="admin"></param>
        /// <returns></returns>
        int Add(T model);

        /// <summary>
        /// 根据id删除model
        /// </summary>
        /// <param name="id">model的id</param>
        /// <returns></returns>
        int Delete(int id);

        /// <summary>
        /// 修改model
        /// </summary>
        /// <param name="admin"></param>
        /// <returns></returns>
        int Update(T model);
    }
}
