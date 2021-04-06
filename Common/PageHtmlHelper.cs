using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public class PageHtmlHelper
    {
        public static string GetPagaBar(int pageIndex, int pageCount,Dictionary<string,int> dicParam)
        {
            //if (pageCount == 1)
            //{
            //    return string.Empty;
            //}
            // 计算起始位置.要求页面上显示10个数字页码
            int start = pageIndex - 5;
            if (start < 1)
            {
                start = 1;
            }
            // 计算终止位置
            int end = start + 9;
            if (end > pageCount)
            {
                end = pageCount;
                // 重新计算一下Start值.
                start = end - 9 < 1 ? 1 : end - 9;
            }
            StringBuilder sb = new StringBuilder();
            if (pageIndex > 1)
            {
                sb.AppendFormat($"<a href='?pageIndex={pageIndex - 1}");
                foreach (var item in dicParam)
                {
                    sb.Append($"&{item.Key + "=" + item.Value}");
                }
                sb.Append("'>上一页</a>");
            }
            for (int i = start; i <= end; i++)
            {
                if (i == pageIndex)
                {
                    sb.AppendFormat($"<a class='page-conselect'>{i}</a>");
                }
                else
                {
                    sb.AppendFormat($"<a href='?pageIndex={i}");
                    foreach (var item in dicParam)
                    {
                        sb.Append($"&{item.Key + "=" + item.Value}");
                    }
                    sb.Append($"'>{i}</a>");
                }
            }
            if (pageIndex < pageCount)
            {
                sb.AppendFormat($"<a href='?pageIndex={pageIndex + 1}");
                foreach (var item in dicParam)
                {
                    sb.Append($"&{item.Key + "=" + item.Value}");
                }
                sb.Append("'>下一页</a>");
            }

            return sb.ToString();
        }
    }
}
