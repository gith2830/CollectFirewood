﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CollectFirewood.Member.Index" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="/Content/Js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="/Content/Css/拾柴网.css">
    <link rel="stylesheet" href="/Content/Css/grid.css">
</head>

<body>
    <form action="" method="post">
            <!-- 头部 -->
    <header class="top ">
        <div class="middle grid">
            <div class="top-logobox grid-cell-1">
                <img src="/Material/logo.png" alt="">
            </div>
            <div class="top-listbox grid-cell-1"> 
                <ul>
                    <li><a href="#" class="active1">首页</a></li>
                    <li><a href="BrowseItems.aspx">浏览项目</a></li>
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
    <!-- 类型 -->
    <div class="type">
        <div class="middle">
            <ul id="type">
                <asp:Repeater ID="TypeList" runat="server">
                   <ItemTemplate>
                        <li><a href="index.aspx?ClassifyId=<%# Eval("Id") %>"><%# Eval("ClassifyName") %> </a></li>
                   </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
    <div class="middle">
        <div id="content">
            <!-- 首页 -->
            <div class="home contentbox">
                <span class="home-picbox">
                    <a href="#">
                        <img src="/Material/1.jpg" alt=""></a>
                    <a href="#">
                        <img src="/Material/2.jpg" alt=""></a>
                    <a href="#">
                        <img src="/Material/3.jpg" alt=""></a>
                    <a href="#">
                        <img src="/Material/4.jpg" alt=""></a>
                </span>
                <span class="home-manufacture">
                    <span class="home-manufacture_listbox ">
                        <span style="font-size: 24px; font-weight: bold; float: left;">众筹制造</span>
                       <%-- <ul>
                            <li><a href="#">科技</a></li>
                            <li><a href="#">艺术</a></li>
                            <li><a href="#">设计</a></li>
                            <li><a href="#">音乐</a></li>
                            <li><a href="#">影视</a></li>
                            <li><a href="#">出版</a></li>
                            <li><a href="#">动漫</a></li>
                            <li><a href="#">工艺</a></li>
                            <li><a href="#">公开课</a></li>
                            <li><a href="#">农业</a></li>
                            <li><a href="#">苏州站</a></li>
                            <li><a href="#">其他</a></li>
                        </ul>--%>
                    </span>

                    <span class="" style="display:block;float:left;margin:0 auto;width:100%;"> 
                        <asp:Repeater ID="ProjectList" runat="server">
                            <ItemTemplate>
                                <a href="Projectinfo.aspx?id=<%# Eval("Id") %>">
                                    <dl style="display:block;width:24%;margin-right:10px;margin-top:20px;">
                                    <dt>
                                        <img src="<%# Eval("CoverImg") %>"></a><span class="like">关注</span></dt>
                                    <dd><%# Eval("ProjectName") %></dd>
                                    <dd>目标:<span><%# Math.Floor(Convert.ToDecimal(Eval("Goal"))) %></span>元<span class="statusbox">众筹中</span></dd>
                                    <dd><progress value="<%# (Convert.ToDecimal(Eval("CurrentMoney").ToString())/Convert.ToDecimal(Eval("Goal").ToString()))*100%>" max="100"></progress></dd>
                                    <dd class="grid"><span class="status grid-cell-1"><span><%# Math.Round((Convert.ToDecimal(Eval("CurrentMoney").ToString())/Convert.ToDecimal(Eval("Goal").ToString()))*100,1) %></span>
                                        <h6 class="ccc">已完成</h6>
                                    </span><span class="grid-cell-1 status"><span><%# Math.Floor(Convert.ToDecimal(Eval("CurrentMoney"))) %></span>元<h6 class="ccc">已筹资</h6>
                                    </span><span class="grid-cell-1 status"><span><%# (Convert.ToDateTime(Eval("Deadline")).Date).Subtract(DateTime.Now.Date).Days%></span>天<h6 class="ccc">剩余时间</h6>
                                    </span></dd>
                                </dl>
                                </a>
                            </ItemTemplate>
                        </asp:Repeater>
                    </span>               
            </div>          
        </div>
    </div>
    <div class="middle">
        <%--<a href="#" class="pageitem">上一页</a>
        <a href="#" class="pageitem">1</a>
        <a href="#" class="pageitem">2</a>
        <a href="#" class="pageitem">3</a>
        <a href="#" class="pageitem">4</a>
        <a href="#" class="pageitem">5</a>
        <a href="#" class="pageitem">下一页</a>--%>
        <%=Common.PageHtmlHelper.GetPagaBar(PageIndex, PageCount) %>
    </div>
    <div class="middle" style="background-color:"red";>
        <!-- 底部 -->
        <div class="botton">
            <span>我们已经收到~~~</span>
            <div class="botton-collect">
                <div class="botton-collect_left">
                    <dl>
                        <dt>
                            <img src="/Material/钱包.png" alt=""></dt>
                        <dd class="red"><span>0</span>元</dd>
                        <dd>爱情保险</dd>
                    </dl>
                    <dl>
                        <dt>
                            <img src="/Material/叶子.png" alt=""></dt>
                        <dd class="red"><span>0</span>小时</dd>
                        <dd>爱情保险</dd>
                    </dl>
                    <dl>
                        <dt>
                            <img src="/Material/人群.png" alt=""></dt>
                        <dd class="red"><span>0</span>人</dd>
                        <dd>爱情保险</dd>
                    </dl>
                </div>
                <div class="botton-collect_right">
                    <dl>
                        <dt style="background-color: pink;">
                            <img src="/Material/奖杯.png" alt=""></dt>
                        <dd>项目总数</dd>
                        <dd style="color: pink;"><span>0</span>个</dd>
                    </dl>
                    <dl>
                        <dt style="background-color: thistle;">
                            <img src="/Material/钱.png" alt=""></dt>
                        <dd>累计支持人</dd>
                        <dd style="color: thistle;"><span>0</span>元</dd>
                    </dl>
                    <dl>
                        <dt style="background-color: orange;">
                            <img src="/Material/人.png" alt=""></dt>
                        <dd>累计筹资数</dd>
                        <dd style="color: orange;"><span>0</span>人</dd>
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
    <script>
        // 首页盒子中的轮播图方法
        function show(cur) {
            $(".home-picbox a").eq(cur).fadeIn(1000).siblings("a").fadeOut(1000);
        }
        var cur = 0;
        var timer = null;
        // 首页盒子中的轮播图方法
        function showing() {
            timer = setInterval(function () {
                cur++;
                if (cur > $(".home-picbox a").length - 1) {
                    cur = 0;
                }
                show(cur);
            }, 2000)
        }
        showing();
        // 当鼠标移动到图片上时候清楚计数器
        $(".home-picbox a").mouseover(function () {
            stop();
            clearInterval(timer);
        })
        // 当鼠标移动出图片启动计数器
        $(".home-picbox a").mouseout(function () {
            showing();
        })
    </script>
</body>

</html>
