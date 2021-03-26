using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace CollectFirewood.Ashx
{
    /// <summary>
    /// ValidateCode 的摘要说明
    /// </summary>
    public class ValidateCode : IHttpHandler, IRequiresSessionState
    {
        HttpContext Context { get; set; }
        public void ProcessRequest(HttpContext context)
        {
            this.Context = context;
            string code = GenerateCheckCode();
            CreateCheckCodeImage(code, (int)Math.Ceiling((code.Length * 12.5)), 22);
        }

        private string GenerateCheckCode()
        {
            int number;
            char code;
            string checkCode = String.Empty;

            System.Random random = new Random();

            for (int i = 0; i < 5; i++)
            {
                number = random.Next();

                if (number % 2 == 0)
                    code = (char)('0' + (char)(number % 10));
                else
                    code = (char)('0' + (char)(number % 10));

                checkCode += code.ToString();
            }

            Context.Session.Add("vCode", checkCode);
            return checkCode;
        }

        private void CreateCheckCodeImage(string checkCode,int width,int height)
        {
            if (checkCode == null || checkCode.Trim() == String.Empty)
                return;

            Bitmap image = new Bitmap(width, height);
            Graphics g = Graphics.FromImage(image);

            try
            {
                Random random = new Random();
                //清空为白色画布
                g.Clear(Color.White);
                //画图片的背景噪音线
                for (int i = 0; i < 25; i++)
                {
                    int x1 = random.Next(image.Width);
                    int x2 = random.Next(image.Width);
                    int y1 = random.Next(image.Height);
                    int y2 = random.Next(image.Height);

                    g.DrawLine(new Pen(Color.Silver), x1, y1, x2, y2);
                }
                Font font = new Font("Arial", 12, (FontStyle.Bold | FontStyle.Italic));
                LinearGradientBrush brush = new LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height), Color.Blue, Color.DarkRed, 1.2f, true);
                g.DrawString(checkCode, font, brush, 2, 2);

                //画图片的前景噪音点
                for (int i = 0; i < 100; i++)
                {
                    int x = random.Next(image.Width);
                    int y = random.Next(image.Height);

                    image.SetPixel(x, y, Color.FromArgb(random.Next()));
                }
                //画图片的边框线
                g.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);
                System.IO.MemoryStream ms = new System.IO.MemoryStream();
                image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
                Context.Response.ClearContent();
                Context.Response.ContentType = "image/Gif";
                Context.Response.BinaryWrite(ms.ToArray());
            }
            finally
            {
                g.Dispose();
                image.Dispose();
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}