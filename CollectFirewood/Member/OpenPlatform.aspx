<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OpenPlatform.aspx.cs" Inherits="CollectFirewood.Member.OpenPlatform" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>开放平台</title>
    <script src="/Content/Js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="/Content/Css/拾柴网.css">
    <link rel="stylesheet" href="/Content/Css/grid.css">
</head>

<body>
    <form runat="server">
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
                    <li><a href="#" class="active1">开放平台</a></li>
                    <li><a href="NoviceHelp.aspx">新手帮助</a></li>
                    <li><a href="ProjectLaunch.aspx">发起项目</a></li>
                </ul>
            </div>
            <div class="top-searchbox grid-cell-1" style="display:none;">
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
                      <li>
                            <asp:Button ID="btnofExit" runat="server" Text="Exit" style="background-color:transparent;width:40px;border:none;color:red;" OnClick="btnofExit_Click" /></li>
                    <%}%>
                </ul>
            </div>
        </div>
    </header>
    <div class="middle">
        <!-- 开放平台 -->
        <div class="open contentbox">
            <div class="openinfobox">
                <asp:Repeater ID="ProjectList" runat="server">
                    <ItemTemplate>
                        <a href="#" class="openinfobox-link">
                            <dl class="openinfobox__item grid" >
                                <dt style="width:30%;">
                                    <img src="<%# Eval("CoverImg") %>" alt="">
                                </dt>
                                <dd style="width:70%;text-overflow:ellipsis;" >
                                    <h1><%# Eval("ProjectName") %></h1>                                  
                                    <p>项目发起人:&nbsp;<%# Eval("Nickname") %></p>
                                    <p>发布地区:&nbsp;<%# Eval("Address") %></p>
                                    <p>项目详情:&nbsp</p>                                    
                                    <p title="<%# Eval("Content") %>"><span style="display:inline-block;width:80px;"></span><%# Eval("Content") %></p>
                                </dd>
                            </dl>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
                <span class="openinfobox__more"><asp:Button ID="btnOfMore" runat="server" Text="点击查看更多" BorderStyle="None" BackColor="#E1E1E1" OnClick="btnOfMore_Click"></asp:Button></span>
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

    </form>
  
</body>

</html>
