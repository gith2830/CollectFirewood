using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    /// <summary>
    /// service接口
    /// </summary>
    /// <typeparam name="T">模型类型</typeparam>
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
        /// 从第start行数据获取到end行的数据
        /// </summary>
        /// <param name="start">开始行</param>
        /// <param name="end">结束行</param>
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
