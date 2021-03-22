<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Projectinfo.aspx.cs" Inherits="CollectFirewood.Member.Projectinfo" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="/Content/Css/拾柴网.css">
    <link rel="stylesheet" href="/Content/Css/grid.css">
</head>
<body>
    <!-- 头部 -->
    <header class="top ">
        <div class="middle grid">
            <div class="top-logobox grid-cell-1">
                <img src="/Material/logo.png" alt="">
            </div>
            <div class="top-listbox grid-cell-1">
                <ul>
                    <li><a href="index.aspx">首页</a></li>
                    <li><a href="BrowseItems" class="active1">浏览项目</a></li>
                    <li><a href="OpenPlatform.aspx">开放平台</a></li>
                    <li><a href="NoviceHelp.aspx">新手帮助</a></li>
                    <li><a href="ProjectLaunch.aspx">发起项目</a></li>
                </ul>
            </div>
            <div class="top-searchbox grid-cell-1">
                <input type="text" name="" id="" placeholder="搜索">
                <div class="top-searchbox_btn"></div>
            </div>
            <div class="top-toolbox grid-cell-1">
                <ul>
                    <%if (Session["user"] == null)
                        { %>
                    <li><a href="UserLogin.aspx" id="login">登录</a></li>
                    <% } %>
                    <%else
                        {%>
                    <li><a href="Userinfo.aspx"><%=(Session["user"] as Model.User).Nickname %></a></li>
                    <%}%>
                </ul>
            </div>
        </div>
    </header>
    <!--主体-->
    <section>
        <div class="middle">
            <!-- 项目内容 -->
            <form runat="server">
                <div class="projectinfobox grid">
                    <!-- 左边 -->
                    <div class="projectinfobox-left">
                        <h2><%=this.project.ProjectName %></h2>
                        <span class="projectinfobox-people">发起人姓名：&nbsp;<%=this.User.Nickname %></span>
                        <span class="projectinfobox-address">截至时间：<%=this.project.Deadline %>&nbsp;</span>
                        <div class="projectContent">
                            <%=this.project.Content %>
                        </div>
                        <div class="Saybox">
                            <div>
                                <span>img</span>&nbsp;<span>nickname</span>&nbsp;<span>time</span>
                                <p>SayContent</p>
                            </div>
                        </div>
                        <asp:TextBox runat="server" TextMode="MultiLine" ID="Comment" />
                        <asp:Button ID="btnSend" runat="server" Text="发表" />
                    </div>
                    <!-- 右边 -->
                    <div class="projectinfobox-right">
                        <div class="right-like">
                            <input type="button" value="支持" class="support">
                            <input type="button" value="关注" class="fllow">
                        </div>
                        <!-- 喜欢和支持 -->
                        <div class="returnbox" style="height: 300px;">
                            <span style="color: grey;">目前累计金额</span><span class="returnbox-state" style="float: right;">众筹中</span>
                            <h1>￥<%=Math.Round(this.project.CurrentMoney,0) %></h1>
                            <br>
                            <div><span>此项目必须在<span style="color: orange;"><%=this.project.Deadline.ToString("D") %></span>前得到<span style="color: orange">￥<%=Math.Round(this.project.Goal,0) %></span>的支持才算成功</span></div>
                            <br>
                            <progress value="<%=Math.Round((Convert.ToDecimal(this.project.CurrentMoney)/Convert.ToDecimal(this.project.Goal))*100,1) %>"" max="100" style="display: block; height: 60px;"></progress>
                            <br>
                            <table cellspace="1">
                                <tr>
                                    <td>进度</td>
                                    <td>支持者</td>
                                    <td>喜欢</td>
                                    <td>剩余天数</td>
                                </tr>
                                <tr>
                                    <td><%=Math.Round((Convert.ToDecimal(this.project.CurrentMoney)/Convert.ToDecimal(this.project.Goal))*100,1) %>%</td>
                                    <td>23</td>
                                    <td><%=this.project.LikeCount %></td>
                                    <td><%=(Convert.ToDateTime(this.project.Deadline).Date).Subtract(DateTime.Now.Date).Days %>天</td>
                                </tr>
                            </table>
                        </div>
                        <!-- 支持300 -->
                        <div class="returnbox" style="color: grey;">
                            <span>支持￥300</span><span style="float: right;">
                            <br>
                            <div style="margin-top: 20px;">感谢您的支持！您将获得：</div>
                            <div>1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）</div>
                            <div>2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）</div>
                            <div>3.优先获得暑假带薪实习机会</div>
                            <div>4.可优先获得下栋树屋众筹机会</div>
                            <div>配送运费：<span>免费</span></div>
                            <div>预计回报发送时间：<span>项目成功结束后30天内</span></div>
                            <input type="button" value="支持￥300">
                        </div>
                        <!-- 支持1000 -->
                        <div class="returnbox" style="color: grey;">
                            <span>支持￥1000</span><span style="float: right;">已有<span style="color: orange;">8</span>位支持者</span>
                            <br>
                            <div style="margin-top: 20px;">感谢您的支持！您将获得：</div>
                            <div>1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）</div>
                            <div>2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）</div>
                            <div>3.优先获得暑假带薪实习机会</div>
                            <div>4.可优先获得下栋树屋众筹机会</div>
                            <div>配送运费：<span>免费</span></div>
                            <div>预计回报发送时间：<span>项目成功结束后30天内</span></div>
                            <input type="button" value="支持￥1000">
                        </div>
                        <!-- 支持5000 -->
                        <div class="returnbox" style="color: grey;">
                            <span>支持￥5000</span><span style="float: right;">已有<span style="color: orange;">3</span>位支持者</span>
                            <br>
                            <div style="margin-top: 20px;">感谢您的支持！您将获得：</div>
                            <div>1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）</div>
                            <div>2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）</div>
                            <div>3.优先获得暑假带薪实习机会</div>
                            <div>4.可优先获得下栋树屋众筹机会</div>
                            <div>配送运费：<span>免费</span></div>
                            <div>预计回报发送时间：<span>项目成功结束后30天内</span></div>
                            <input type="button" value="支持￥5000">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <div class="footer">
        <!-- 服务 -->
        <div class="serves">
            <div class="middle">
                <div class="serves-box">
                    <h4>众筹项目</h4>
                    <a href="#">科技</a>&nbsp;/&nbsp;<a href="#">艺术</a>&nbsp;/&nbsp;<a href="#">设计</a>
                    /&nbsp;<a href="#">音乐</a>&nbsp;/<br>
                    <a href="#">影视</a>&nbsp;/&nbsp;<a href="#">出版</a>&nbsp;/&nbsp;<a href="#">动漫</a>
                    /&nbsp;<a href="#">公益</a>&nbsp;/<br>
                    <a href="#">公开课</a>&nbsp;/&nbsp;<a href="#">农业</a>&nbsp;/&nbsp;<a href="#">其他</a>&nbsp;/
                </div>
                <div class="serves-box">
                    <h4>关于众筹</h4>
                    <a href="#">关于众筹</a>&nbsp;/&nbsp;<a href="#">联系我们</a>&nbsp;/&nbsp;<a href="#">帮助中心</a>/&nbsp;<br>
                    <a href="#">团队介绍</a>&nbsp;/&nbsp;<a href="#">服务协议</a>&nbsp;/&nbsp;<a href="#">项目发起规范</a>/&nbsp;<br>
                </div>
                <div class="serves-box">
                    <h4>关注我们</h4>
                    <a href="#">百度贴吧</a>&nbsp;/&nbsp;<a href="#">QQ空间</a>&nbsp;/&nbsp;<a href="#">新浪微博</a>/&nbsp;<br>
                    <a href="#">豆瓣小站</a>&nbsp;/
                </div>
                <div class="serves-box">
                    <h4>服务</h4>
                    <a href="#">投资金融服务</a>&nbsp;/
                </div>
                <div class="serves-box">
                    <h1>众筹网</h3>
                            <h5>zhongchou.cn</h5>
                </div>
            </div>
        </div>
        <!-- 版权 -->
        <div class="copyright">
            <div class="middle">
                <span style="color: lightgray;">友情链接：</span>
                <a href="#">和讯网</a>&nbsp;<a href="#">雷锋网</a>&nbsp;<a href="#">36氪
                </a>&nbsp;<a href="#">好123</a>&nbsp;<a href="#">360安全网址</a>
                &nbsp;<a href="#">北青网</a>&nbsp;<a href="#">凤凰网</a>&nbsp;<a href="#">金融界</a>
                &nbsp;<a href="#">财新网</a>&nbsp;<a href="#">钛媒体</a>&nbsp;<a href="#">IMGII</a>
                &nbsp;<a href="#">电影网</a>&nbsp;<a href="#">雅昌艺术网</a>&nbsp;<a href="#">V电影</a>
                &nbsp;<a href="#">易观网</a>&nbsp;<a href="#">投资界</a>&nbsp;<a href="#">亿邦动力社区</a>
                &nbsp;<a href="#">拉勾网</a>&nbsp;<a href="#">金融工厂</a>&nbsp;<a href="#">投融中国联盟</a>
                &nbsp;<a href="#">友好基金会</a>&nbsp;<a href="#">人人生活</a>&nbsp;<a href="#">众筹导航</a>
                &nbsp;<a href="#">调查派</a>&nbsp;<a href="#">奇笛网</a>&nbsp;<a href="#">融360</a>&nbsp;<a href="#">联信财富</a>
                <br>
                <span style="margin-top: 20px; display: block; color: lightgray;">2014 北京东方联合投资管理有限公司 zhongchou.cn 版权所有
                        京ICP备14016844号</span>
            </div>
        </div>
    </div>

</body>
</html>
