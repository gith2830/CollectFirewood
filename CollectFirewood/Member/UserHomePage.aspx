<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHomePage.aspx.cs" Inherits="CollectFirewood.Member.UserHomePage" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人主页</title>
    <script src="/Content/Js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="/Content/Css/拾柴网.css">
    <link rel="stylesheet" href="/Content/Css/grid.css">
</head>

<body>
    <form runat="server" method="post">
          <!-- 头部 -->
    <header class="top ">
        <div class="middle grid">
            <div class="top-logobox grid-cell-1">
                <img src="/Material/logo.png" alt="">
            </div>
            <div class="top-listbox grid-cell-1">
                <ul>
                    <li><a href="index.aspx">首页</a></li>
                    <li><a href="BrowseItems.aspx">浏览项目</a></li>
                    <li><a href="OpenPlatform.aspx">开放平台</a></li>
                    <li><a href="NoviceHelp.aspx">新手帮助</a></li>
                    <li><a href="ProjectLaunch.aspx">发起项目</a></li>
                </ul>
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
                      <li>
                            <asp:Button ID="btnofExit" runat="server" Text="Exit" style="background-color:transparent;width:40px;border:none;color:red;" OnClick="btnofExit_Click" /></li>
                    <%}%>
                </ul>
            </div>
        </div>
    </header>
    <div class="middle">
        <div id="content">
            <!-- 用户主页 -->
            <div class="homepage">
                    <dl>
                        <dt style="margin-right:20px;">
                            <img style="width: 100%; height: 100%;" src="<%=(Session["user"] as Model.User).UserPic %>" /></dt>
                        <dd id="homepage-usernum">用户名:&nbsp;<%=(Session["user"] as Model.User).Nickname %></dd>
                        <dd>个性签名:&nbsp;<span><%=(Session["user"] as Model.User).Description %></span></dd>
                        <dd>所在地区:&nbsp;<span><%=(Session["user"] as Model.User).Address %></span></dd>
                        <dd>
                            <asp:Button ID="btnUserInfo" runat="server" Text="个人设置" OnClick="btnUserInfo_Click" Style="border:none;color:white;background-color:#ccc;width:60px;height:18px;" /></dd>
                    </dl>
                <ul class="meaulist">
                    <li><a href="UserHomePage.aspx?Support=0">支持的项目 </a></li>
                    <li><a href="UserHomePage.aspx?Launch=0">发起的项目</a></li>
                    <li><a href="UserHomePage.aspx?Like=0">喜欢的项目</a></li>
                </ul>
                <ul class="homepagetype">
                    <li><a href="UserHomePage.aspx?State=2">所有</a></li>
                    <li><a href="UserHomePage.aspx?State=0">众筹中</a></li>
                    <li><a href="UserHomePage.aspx?State=1">已成功</a></li>
                </ul>
                <br>
                <table>
                    <tr>
                        <td>项目名称</td>
                        <td>截止日期</td>
                        <td>目标金额</td>
                        <td>当前金额</td>
                        <td>项目进度</td>
                        <td>关注人数</td>
                    </tr>
                    <asp:Repeater ID="RepeaterOfProjectInfo" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ProjectName") %></td>
                                <td><%# Eval("Deadline") %></td>
                                <td><%# Math.Round(Convert.ToDouble(Eval("Goal")),0) %></td>
                                <td><%# Math.Round(Convert.ToDouble(Eval("CurrentMoney")),0) %></td>
                                <td><%# Math.Round((Convert.ToDecimal(Eval("CurrentMoney").ToString())/Convert.ToDecimal(Eval("Goal").ToString()))*100,1) %>%</td>
                                <td><%# Eval("LikeCount") %>人</td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
    </div>
    <div class="middle">
        <!-- 底部 -->
        <div class="botton">
            <span>我们已经收到~~~</span>
            <%--<div class="botton-collect">
                <div class="botton-collect_left">
                     <dl>
                        <dt>
                            <img src="/Material/钱包.png" alt=""></dt>
                        <dd class="red"><span><%=Session["SumOfCurrentMoney"] %></span>元</dd>
                        <dd>筹资总数</dd>
                    </dl>
                    <dl>
                        <dt>
                            <img src="/Material/叶子.png" alt=""></dt>
                        <dd class="red"><span><%=Session["SumOfProject"] %></span>个</dd>
                        <dd>项目总个数</dd>
                    </dl>
                    <dl>
                        <dt>
                            <img src="/Material/人群.png" alt=""></dt>
                        <dd class="red"><span><%=Session["SumOfSupportProjects"] %></span>次</dd>
                        <dd>累计支持人次</dd>
                    </dl>
                </div>--%>
                <div class="botton-collect_right">
                    <dl>
                        <dt style="background-color: pink;">
                            <img src="/Material/奖杯.png" alt=""></dt>
                        <dd>项目总数</dd>
                        <dd style="color: pink;"><span><%=Session["SumOfProject"] %></span>个</dd>
                    </dl>
                    <dl>
                        <dt style="background-color: thistle;">
                            <img src="/Material/人.png" alt=""></dt>
                        <dd>累计支持人次</dd>
                        <dd style="color: thistle;"><span><%=Session["SumOfSupportProjects"] %></span>次</dd>
                    </dl>
                    <dl>
                        <dt style="background-color: orange;">
                            <img src="/Material/钱.png" alt=""></dt>
                        <dd>累计筹资数</dd>
                        <dd style="color: orange;"><span><%=Session["SumOfCurrentMoney"] %></span>元</dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>
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
                <h1>众筹网</h1>
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
    </form>
</body>

</html>
