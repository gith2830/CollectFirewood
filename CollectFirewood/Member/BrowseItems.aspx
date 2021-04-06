<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BrowseItems.aspx.cs" Inherits="CollectFirewood.Member.BrowseItems" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>浏览项目</title>
    <script src="/Content/Js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="/Content/Css/拾柴网.css">
    <link rel="stylesheet" href="/Content/Css/grid.css">
</head>

<body>
    <form action="" runat="server" method="get">
            <!-- 头部 -->
    <%--<header class="top ">
        <div class="middle grid">
            <div class="top-logobox grid-cell-1">
                <img src="/Material/logo.png" alt="">
            </div>
            <div class="top-listbox grid-cell-1">
                <ul>
                    <li><a href="index.aspx">首页</a></li>
                    <li><a href="#" class="active1">浏览项目</a></li>
                    <li><a href="OpenPlatform.aspx">开放平台</a></li>
                    <li><a href="NoviceHelp.aspx">新手帮助</a></li>
                    <li><a href="ProjectLaunch.aspx">发起项目</a></li>
                </ul>
            </div>
           <div class="top-searchbox grid-cell-1">
                 <asp:TextBox ID="TextBox1" runat="server" placeholder="搜索"></asp:TextBox>
                 <a href="#"><div class="top-searchbox_btn"></div></a>
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
    </header>--%>
                <header class="top ">
            <div class="middle grid">
                <div class="top-logobox grid-cell-1">
                    <img src="/Material/logo.png" alt="">
                </div>
                <div class="top-listbox grid-cell-1">
                    <ul>
                        <li><a href="Index.aspx">首页</a></li>
                        <li><a href="#" class="active1">浏览项目</a></li>
                        <li><a href="OpenPlatform.aspx">开放平台</a></li>
                        <li><a href="NoviceHelp.aspx">新手帮助</a></li>
                        <li><a href="ProjectLaunch.aspx">发起项目</a></li>
                    </ul>
                </div>
                 <div class="top-searchbox grid-cell-1">
                 <input type="text" placeholder="搜索" name="KeyWords"/>
                 <button  style="border:none;outline:none;background-color:transparent;float:left;"><div class="top-searchbox_btn"></div></button>
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
    <!-- 类型 -->
    <div class="type">
        <div class="middle">
            <ul id="type">
                <asp:Repeater ID="TypeList" runat="server">
                   <ItemTemplate>
                        <li><a href="BrowseItems.aspx?classifyId=<%# Eval("Id") %>&state=<%=Convert.ToInt32(State) %>"><%# Eval("ClassifyName") %></a></li>
                   </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
    <div class="middle">
        <!-- 浏览项目 -->
        <div class="browse contentbox ">
            <span class="browse-listbox">
                <ul class="grid">
                    <li class="grid-cell-1"><a style="text-decoration:none;color:black;" href="BrowseItems.aspx?state=2" class="">所有项目</a></li>
                    <li class="grid-cell-1"><a href="BrowseItems.aspx?state=0&classifyId=<%=ClassifyId %>" class=" 
                        <% if (Session["state"] != null && Session["state"].ToString() == "InProgress")
                                                { %>
                            stateselect state
                       <%  }%>
                        <%else
                                                { %>
                         state 
                        <%} %>
                        ">进行中</a></li>
                    <li class="grid-cell-1"><a href="BrowseItems.aspx?state=1&classifyId=<%=ClassifyId %>" class="state <% if (Session["state"]!=null&&Session["state"].ToString()=="Finish")
                           { %>
                            stateselect state
                       <%  }%>
                         <%else
                                                { %>
                         state 
                        <%} %>
                        "">已结束</a></li>
                    <li class="grid-cell-1"></li>
                    <li class="grid-cell-1"></li>
                    <li class="grid-cell-1"></li>
                    <li class="grid-cell-1"></li>
                    <li class="grid-cell-1"></li>
                    <li class="grid-cell-1"></li>
                    <li class="grid-cell-1">
                    </li>
                </ul>
            </span>
            <span id="browse-main">
                <div class="browse-main_all browse-mainbox">
                    <span class="" style="display:block;float:left;margin:0 auto;width:100%;">
                        <asp:Repeater ID="ProjectList" runat="server">
                            <ItemTemplate>
                                <a href="Projectinfo.aspx?id=<%# Eval("Id") %>" style="color:black;">
                                    <dl style="display: block; width: 24%; margin-right: 10px; margin-top: 20px;">
                                    <dt>
                                        <img src="<%# Eval("CoverImg") %>"></dt>
                                    <dd><%# Eval("ProjectName") %></dd>
                                    <dd>目标:<span><%# Math.Floor(Convert.ToDecimal(Eval("Goal"))) %></span>元&nbsp;&nbsp;&nbsp;&nbsp;关注人数:<span><%# Eval("LikeCount") %></span></dd>
                                    <dd><progress value="<%# (Convert.ToDecimal(Eval("CurrentMoney").ToString())/Convert.ToDecimal(Eval("Goal").ToString()))*100%>" max="100"></progress></dd>
                                    <dd class="grid"><span style="color:red;" class="status grid-cell-1"><%# Math.Round((Convert.ToDecimal(Eval("CurrentMoney").ToString())/Convert.ToDecimal(Eval("Goal").ToString()))*100,1) %>%</span>
                                    </span><span class="grid-cell-1 status"><%# Math.Floor(Convert.ToDecimal(Eval("CurrentMoney"))) %>元</>
                                    </span><span class="grid-cell-1 status"><%# (Convert.ToDateTime(Eval("Deadline")).Date).Subtract(DateTime.Now.Date).Days%>天</span>
                                    </span></dd>
<dd class="grid" style="text-align:center;"><span class="grid-cell-1 status">进度</span><span class="grid-cell-1 status">筹资</span><span class="grid-cell-1 status">时间</span></dd>
                                </dl>
                                </a>                                      
                            </ItemTemplate>
                        </asp:Repeater>                                       
                    </span>                    
                 </div>
            </span>
        </div>
    </div>
            <%var dic = new Dictionary<string,int>();
                if (Session["state"] != null)
                {
                    dic.Add("state", Convert.ToInt32(Session["state"]));
                }
                if (Session["classifyId"]!=null)
                {
                    dic.Add("classifyId", Convert.ToInt32(Session["classifyId"]));
                }
                Session["state"] = null;
                Session["classifyId"] = null;
                %>
          <div class="page-con middle"> <%=Server.UrlDecode(Common.PageHtmlHelper.GetPagaBar(PageIndex, PageCount,dic)) %> </div>
    <!-- 服务 -->
    <div class="serves" style="float:left;">
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
    <div class="copyright" style="float:left;">
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
<script>
    $("#browse-main .browse-mainbox").eq(0).show();
    //$(".browse-listbox ul li").eq(0).addClass("active3");
    ////  浏览项目  页面选项卡切换（所有项目  众筹中  已经完成）
    //$(".browse-listbox ul li a").each(function (index) {
    //    $(this).click(function () {
    //        if (index > 2) {
    //            return;
    //        }
    //        $(".browse-listbox ul li").eq(index).addClass("active3").siblings().removeClass("active3");
    //        //$("#browse-main .browse-mainbox").eq(index).show().siblings().hide();
    //    })
    //})
</script>
</html>
