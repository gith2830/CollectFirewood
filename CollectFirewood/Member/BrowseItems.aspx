﻿<!DOCTYPE html>
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
    <!-- 头部 -->
    <header class="top ">
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
                <input type="text" name="" id="" placeholder="搜索">
                <div class="top-searchbox_btn"></div>
            </div>
            <div class="top-toolbox grid-cell-1">
                <ul>
                    <li><a href="#" id="login">登录</a></li>
                    <li style="display: none;"><a href="#" id="userhomepage">主页</a></li>
                </ul>
            </div>
        </div>
    </header>
    <!-- 类型 -->
    <div class="type">
        <div class="middle">
            <ul id="type">
                <li><a href="#" class="active2">浏览全部</a></li>
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
                <li><a href="#">其他</a></li>
                <li>|</li>
                <li><a href="#">苏州站</a></li>
            </ul>
        </div>
    </div>
    <div class="middle">        
            <!-- 浏览项目 -->
            <div class="browse contentbox ">
                <span class="browse-listbox">
                    <ul class="grid">
                        <li class="grid-cell-1">所有项目<span>0</span></li>
                        <li class="grid-cell-1">众筹中<span>0</span></li>
                        <li class="grid-cell-1">已成功<span>0</span></li>
                        <li class="grid-cell-1"></li>
                        <li class="grid-cell-1"></li>
                        <li class="grid-cell-1"></li>
                        <li class="grid-cell-1"></li>
                        <li class="grid-cell-1"></li>
                        <li class="grid-cell-1"></li>
                        <li class="grid-cell-1">
                            <select name="" id="">
                                <option value="">排列方式</option>
                                <option value="">排序2</option>
                                <option value="">排序3</option>
                            </select>
                        </li>
                    </ul>
                </span>
                <span id="browse-main">
                    <div class="browse-main_all grid browse-mainbox">
                        <span class="grid" style="flex-wrap: wrap;">
                            <dl class="grid-cell-1">
                                <dt><a href=""><img src="/Material/咖啡厅.jpg" alt=""></a><span class="like">关注</span></dt>
                                <dd>【大卫咖啡】国家首个电商咖啡</dd>
                                <dd>目标:<span>0</span>天<span>0</span>元<span class="statusbox">众筹中</span></dd>
                                <dd><progress value="30" max="100"></progress></dd>
                                <dd class="grid"><span class="status grid-cell-1"><span>30%</span>
                                        <h6 class="ccc">已完成</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>元<h6 class="ccc">已筹资</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>天<h6 class="ccc">剩余时间</h6>
                                    </span></dd>
                            </dl>
                            <dl class="grid-cell-1">
                                <dt><a href=""><img src="/Material/电影院.jpg" alt=""></a><span class="like">关注</span></dt>
                                <dd>【大卫电影院】国家首个电商电影院</dd>
                                <dd>目标:<span>0</span>天<span>0</span>元<span class="statusbox">众筹中</span></dd>
                                <dd><progress value="30" max="100"></progress></dd>
                                <dd class="grid"><span class="status grid-cell-1"><span>30%</span>
                                        <h6 class="ccc">已完成</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>元<h6 class="ccc">已筹资</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>天<h6 class="ccc">剩余时间</h6>
                                    </span></dd>
                            </dl>
                            <dl class="grid-cell-1">
                                <dt><a href=""><img src="/Material/相声.jpg" alt=""></a><span class="like">关注</span></dt>
                                <dd>【大卫相声】国家首个电商相声院</dd>
                                <dd>目标:<span>0</span>天<span>0</span>元<span class="statusbox">众筹中</span></dd>
                                <dd><progress value="30" max="100"></progress></dd>
                                <dd class="grid"><span class="status grid-cell-1"><span>30%</span>
                                        <h6 class="ccc">已完成</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>元<h6 class="ccc">已筹资</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>天<h6 class="ccc">剩余时间</h6>
                                    </span></dd>
                            </dl>
                            <br>
                            <dl class="grid-cell-1">
                                <dt><a href=""><img src="/Material/咖啡厅.jpg" alt=""></a><span class="like">关注</span></dt>
                                <dd>【大卫咖啡】国家首个电商咖啡</dd>
                                <dd>目标:<span>0</span>天<span>0</span>元<span class="statusbox">众筹中</span></dd>
                                <dd><progress value="30" max="100"></progress></dd>
                                <dd class="grid"><span class="status grid-cell-1"><span>30%</span>
                                        <h6 class="ccc">已完成</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>元<h6 class="ccc">已筹资</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>天<h6 class="ccc">剩余时间</h6>
                                    </span></dd>
                            </dl>
                            <dl class="grid-cell-1">
                                <dt><a href=""><img src="/Material/咖啡厅.jpg" alt=""></a><span class="like">关注</span></dt>
                                <dd>【大卫咖啡】国家首个电商咖啡</dd>
                                <dd>目标:<span>0</span>天<span>0</span>元<span class="statusbox">众筹中</span></dd>
                                <dd><progress value="30" max="100"></progress></dd>
                                <dd class="grid"><span class="status grid-cell-1"><span>30%</span>
                                        <h6 class="ccc">已完成</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>元<h6 class="ccc">已筹资</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>天<h6 class="ccc">剩余时间</h6>
                                    </span></dd>
                            </dl>
                            <dl class="grid-cell-1">
                                <dt><a href=""><img src="/Material/电影院.jpg" alt=""></a><span class="like">关注</span></dt>
                                <dd>【大卫电影院】国家首个电商电影院</dd>
                                <dd>目标:<span>0</span>天<span>0</span>元<span class="statusbox">众筹中</span></dd>
                                <dd><progress value="30" max="100"></progress></dd>
                                <dd class="grid"><span class="status grid-cell-1"><span>30%</span>
                                        <h6 class="ccc">已完成</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>元<h6 class="ccc">已筹资</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>天<h6 class="ccc">剩余时间</h6>
                                    </span></dd>
                            </dl>
                            <dl class="grid-cell-1">
                                <dt><a href=""><img src="/Material/相声.jpg" alt=""></a><span class="like">关注</span></dt>
                                <dd>【大卫相声】国家首个电商相声院</dd>
                                <dd>目标:<span>0</span>天<span>0</span>元<span class="statusbox">众筹中</span></dd>
                                <dd><progress value="30" max="100"></progress></dd>
                                <dd class="grid"><span class="status grid-cell-1"><span>30%</span>
                                        <h6 class="ccc">已完成</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>元<h6 class="ccc">已筹资</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>天<h6 class="ccc">剩余时间</h6>
                                    </span></dd>
                            </dl>
                            <br>
                            <dl class="grid-cell-1">
                                <dt><a href=""><img src="/Material/咖啡厅.jpg" alt=""></a><span class="like">关注</span></dt>
                                <dd>【大卫咖啡】国家首个电商咖啡</dd>
                                <dd>目标:<span>0</span>天<span>0</span>元<span class="statusbox">众筹中</span></dd>
                                <dd><progress value="30" max="100"></progress></dd>
                                <dd class="grid"><span class="status grid-cell-1"><span>30%</span>
                                        <h6 class="ccc">已完成</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>元<h6 class="ccc">已筹资</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>天<h6 class="ccc">剩余时间</h6>
                                    </span></dd>
                            </dl>
                            <dl class="grid-cell-1">
                                <dt><a href=""><img src="/Material/咖啡厅.jpg" alt=""></a><span class="like">关注</span></dt>
                                <dd>【大卫咖啡】国家首个电商咖啡</dd>
                                <dd>目标:<span>0</span>天<span>0</span>元<span class="statusbox">众筹中</span></dd>
                                <dd><progress value="30" max="100"></progress></dd>
                                <dd class="grid"><span class="status grid-cell-1"><span>30%</span>
                                        <h6 class="ccc">已完成</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>元<h6 class="ccc">已筹资</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>天<h6 class="ccc">剩余时间</h6>
                                    </span></dd>
                            </dl>
                            <dl class="grid-cell-1">
                                <dt><a href=""><img src="/Material/电影院.jpg" alt=""></a><span class="like">关注</span></dt>
                                <dd>【大卫电影院】国家首个电商电影院</dd>
                                <dd>目标:<span>0</span>天<span>0</span>元<span class="statusbox">众筹中</span></dd>
                                <dd><progress value="30" max="100"></progress></dd>
                                <dd class="grid"><span class="status grid-cell-1"><span>30%</span>
                                        <h6 class="ccc">已完成</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>元<h6 class="ccc">已筹资</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>天<h6 class="ccc">剩余时间</h6>
                                    </span></dd>
                            </dl>
                            <dl class="grid-cell-1">
                                <dt><a href=""><img src="/Material/相声.jpg" alt=""></a><span class="like">关注</span></dt>
                                <dd>【大卫相声】国家首个电商相声院</dd>
                                <dd>目标:<span>0</span>天<span>0</span>元<span class="statusbox">众筹中</span></dd>
                                <dd><progress value="30" max="100"></progress></dd>
                                <dd class="grid"><span class="status grid-cell-1"><span>30%</span>
                                        <h6 class="ccc">已完成</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>元<h6 class="ccc">已筹资</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>天<h6 class="ccc">剩余时间</h6>
                                    </span></dd>
                            </dl>
                            <br>
                            <dl class="grid-cell-1">
                                <dt><a href=""><img src="/Material/咖啡厅.jpg" alt=""></a><span class="like">关注</span></dt>
                                <dd>【大卫咖啡】国家首个电商咖啡</dd>
                                <dd>目标:<span>0</span>天<span>0</span>元<span class="statusbox">众筹中</span></dd>
                                <dd><progress value="30" max="100"></progress></dd>
                                <dd class="grid"><span class="status grid-cell-1"><span>30%</span>
                                        <h6 class="ccc">已完成</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>元<h6 class="ccc">已筹资</h6>
                                    </span><span class="grid-cell-1 status"><span>0</span>天<h6 class="ccc">剩余时间</h6>
                                    </span></dd>
                            </dl>
                        </span>
                    </div>
                    <div class="browse-main_ing browse-mainbox">
                        a
                    </div>
                    <div class="browse-main_ed browse-mainbox">
                        d
                    </div>
                </span>
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
    <script>
        $(".browse-listbox ul li").eq(0).addClass("active3");
        $("#browse-main .browse-mainbox").eq(0).show();
        //  浏览项目  页面选项卡切换（所有项目  众筹中  已经完成）
        $(".browse-listbox ul li").each(function (index) {
            $(this).click(function () {
                if (index > 2) {
                    return;
                }
                $(this).addClass("active3").siblings().removeClass("active3");
                $("#browse-main .browse-mainbox").eq(index).show().siblings().hide();
            })
        })
    </script>
</body>

</html>