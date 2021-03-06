<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Examine.aspx.cs" Inherits="CollectFirewood.Member.Examine" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>审批</title>
        <script src="../Content/Js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="/Content/Css/拾柴网.css">
    <link rel="stylesheet" href="/Content/Css/grid.css">
    <link href="../Content/Css/Establish.css" rel="stylesheet" />
    <link href="../Content/Css/Establish_Complete.css" rel="stylesheet" />
    <link href="../Content/Css/Establish_ProjectInformation.css" rel="stylesheet" />
    <link href="../Content/Css/Establish_ReturnSetting.css" rel="stylesheet" />
    <link href="../Content/Css/Establish_SponsorInformation.css" rel="stylesheet" />
</head>
<body>
    <form action="" method="post" runat="server" enctype="multipart/form-data">
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
                        <li><a href="ProjectLaunch.aspx" class="active1">发起项目</a></li>
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
        <div class="middle">
            <!--主体-->
            <section style="width: 90%; margin: 0 auto;">
                <%-- 完成 --%>
                <div class="Content_container" id="complete" style="display: block;">
                    <%-- 上面的进度条 --%>
                    <div class="ProjectInformation_Content__SpeedOfProgress">
                        <span class="SpeedOfProgress__span">项目信息</span>
                        <span class="SpeedOfProgress__span">回报设置</span>
                        <span class="SpeedOfProgress__span">发起人信息</span>
                        <span class="SpeedOfProgress__span">完成</span>
                    </div>
                    <div class="/complete_div">
                        <img src="/Material/完成.png" />
                        <span>
                            <h1>项目已提交，请耐心等待审核</h1>
                        </span>
                    </div>
                </div>
        </div>
        </section>
        </div>
        <!-- 底部-->
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
    </form>
</body>
</html>
