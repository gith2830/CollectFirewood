<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoviceHelp.aspx.cs" Inherits="CollectFirewood.Member.NoviceHelp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新手帮助</title>
    <script src="/Content/Js/jquery-3.3.1.min.js"></script>
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
                    <li><a href="index.aspx" >首页</a></li>
                    <li><a href="BrowseItems.aspx">浏览项目</a></li>
                    <li><a href="openPlatform.aspx">开放平台</a></li>
                    <li><a href="NoviceHelp.aspx" class="active1">新手帮助</a></li>
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
                    <%}%>
                </ul>
            </div>
        </div>
    </header>
 
            <!-- 新手帮助 -->
            <div class="help contentbox">
                <div class="middle">
                    <h1>众筹怎么搞&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;众筹的操作流程介绍</h3>
                        <h4>众筹工作室&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2021-1-1</h4>

                        <p>&nbsp; &nbsp;&nbsp;
                            &nbsp;在以前想要融资创业是一切非常困难的事情，没有强大的人脉网就算你跑断腿也没有办法成功融资。而如今，众筹融资模式的出现让很多创业者、初创公司不再求援无门，
                            如果你是一个创业者，想要知道众筹怎么搞，就必须对众筹的概念、众筹的参与主体以及众筹的操作流程有个详细的了解。</p>
                        <p><strong>众筹的概念</strong></p>
                        <p>&nbsp; &nbsp;&nbsp;
                            &nbsp;顾名思义，众筹就是一些创业者、公司通过互联网上的众筹平台向众人寻求资金援助的一种融资方式。与传统融资方式想比，众筹更为开放，且不限投资者的门槛，
                            只要你的项目能够博得大众的眼球，能够让网友喜欢，都可以通过众筹方式获得项目启动的第一笔资金，很多小本经营或创作的人就是通过众筹实现了自己的梦想。</p>
                        <p><strong>众筹的参与主体</strong></p>
                        <p>&nbsp; &nbsp;&nbsp; &nbsp;众筹的参与主体主要是由筹资人、投资者、众筹平台和第三方托管平台四个部分组成。</p>
                        <p>&nbsp; &nbsp;&nbsp;
                            &nbsp;1、筹资人：创业初期的小企业或者创业者，他们通过自己的能力有了新的产品或服务，但是没有足够的资金来坐起来，因此这些小创业者就会通过众筹的模式来融资。</p>
                        <p>&nbsp; &nbsp;&nbsp;
                            &nbsp;2、投资者：也就是对创业项目的支持者，众筹的投资者通常属于普通草根大众，他们对创业者的项目感兴趣，或者需要他们的产品很服务，被项目的描述所吸引，就会拿出资金来支持这个项目。
                        </p>
                        <p>&nbsp; &nbsp;&nbsp;
                            &nbsp;3、众筹平台：就相当于筹资人和投资者之间的桥梁，起的是中介作用。让筹资者通过平台向投资者展示自己的作品，同时有责任对筹资人的资质与真实性进行必要的审核，以保证投资的安全。
                        </p>
                        <p>&nbsp; &nbsp;&nbsp;
                            &nbsp;4、第三方托管平台：为确保投资者的资金安全，以及投资人的资金能够切实用于创业企业或项目和筹资不成功的及时返回，众筹平台一般都会制定专门银行担任托管人，履行资金托管职责。
                        </p>
                        <p><strong>众筹的操作流程</strong></p>
                        <p>&nbsp; &nbsp;&nbsp;&nbsp;1、筹资者在众多众筹平台中选择一个平台来发起项目，没有账号的要先注册账号成为该平台的会员。</p>
                        <p>&nbsp;
                            &nbsp;&nbsp;&nbsp;2、筹资者向众筹平台提交项目资料，众筹平台依据项目资料对众筹融资的可行性进行审核评估；众筹平台审核通过后，在网络上发布相应的项目信息和融资信息。
                        </p>
                        <p>&nbsp; &nbsp;&nbsp;&nbsp;3、投资者对众筹平台的众多项目进行筛选，选择自己喜欢或适合自己的众筹项目投资，建议投资者在自己能够承受的范围之内进行购买。</p>
                        </p>
                        <p>&nbsp; &nbsp;&nbsp;&nbsp;4、目标期限截止，筹资成功的，筹资者可获得筹集到的资金，投资者则有可能获得一定的回报；筹资不成功的，资金退回各出资人。</p>
                        <p>&nbsp;
                            &nbsp;&nbsp;&nbsp;了解上述的几个知识之后想必你对众筹具体要怎么搞有了一定的了解，建议大家自己去找个众筹平台去练练手。希财网小编认为，众筹作为一个投资方式还是要冒一定的风险的，
                            为此大家尽可能要选择一些实力不错的平台，以最大程度降低自己的投资风险，像京东众筹、淘宝众筹、腾讯乐捐以及希财网众筹都是具有非常不错的影响力的平台。</p>
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
            <span style="margin-top: 20px;display: block;color: lightgray;">2014 北京东方联合投资管理有限公司 zhongchou.cn 版权所有
                京ICP备14016844号</span>
        </div>
    </div>
</body>

</html>