<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectLaunch.aspx.cs" Inherits="CollectFirewood.Member.ProjectLaunch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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
                    <li><a href="#" id="login">登录</a></li>
                    <li style="display: none;"><a href="#" id="userhomepage">主页</a></li>
                </ul>
            </div>
        </div>
    </header>
    <!--主体-->
    <section>
        <div class="launch">
            <div class="launch_span">
                <span>发起项目</span>
            </div>
            <div class="launch_content">
                <div class="content_left">
                    <img src="/Material/红树.png" />
                </div>
                <div class="content_right">
                    <p class="right__p1">
                        <span>如果你有一颗</span><span class="right_span_red">真诚的心</span>
                    </p>
                    <p class="right__p2">
                        <span>那么请在这里发起</span><span class="right_span_red">你的梦想</span>
                    </p>
                    <p class="right__p3">
                        <span>众筹网是一家可以帮助您实现梦想的网站，在这里您可以发布您的梦想、创意和创业<br />
                            计划，并通过网络平台面对公众集资，让有创造力的人可能获得他们所需要的资金，<br />
                            以便使他们的梦想有可能实现。
                        </span>
                    </p>
                    <p class="right__p4">
                        <input id="cbAgree" type="checkbox" />
                        <label for="cbAgree">阅读并同意众筹网的</label>
                        <a href="#">《服务协议》</a><a href="#">《众筹公告》</a>
                    </p>
                    <p>
                        <input id="btnEstablish" type="button" value="立即发起项目" class="right_p5_input" />
                    </p>
                </div>
            </div>
        </div>

        <%-- 项目信息 --%>
        <div class="Content_container hide" id="ProjectInformation">
            <%-- 上面的进度条 --%>
            <div class="ProjectInformation_Content__SpeedOfProgress">
                <span class="SpeedOfProgress__span">项目信息</span>
                <span>回报设置</span>
                <span>发起人信息</span>
                <span>完成</span>
            </div>
            <%-- 下面的信息 --%>
            <%-- 项目信息和草稿图 --%>
            <div class="ProjectInformation_Content__ProjectInformation">
                <%-- 左边的详细项目信息 --%>
                <div class="ProjectInformation_Content__Information">
                    <div class="ProjectInformation_Content__title">项目信息</div>
                    <%-- 详细信息 --%>
                    <div class="ProjectInformation_Content__Detailed">
                        <p>
                            <span>项目名称：</span>
                            <input type="text" id="Content__Detailed__inputName" placeholder="名称不可超过40个字" />
                        </p>
                        <p>
                            <span>筹资金额：</span>
                            <input type="text" name="name" placeholder="不少于500元" />
                            天
                        </p>
                        <p>
                            <span>筹集天数：</span>
                            <input type="text" name="name" placeholder="10~90天" />
                            天
                        </p>
                        <p>
                            <span>类别：</span><br />
                            <br />
                            <input type="button" class="Content__Detailed__Category" value="科技" />
                            <input type="button" class="Content__Detailed__Category" value="艺术" />
                            <input type="button" class="Content__Detailed__Category" value="设计" />
                            <input type="button" class="Content__Detailed__Category" value="影视" />
                            <input type="button" class="Content__Detailed__Category" value="出版" />
                            <input type="button" class="Content__Detailed__Category" value="动漫" />
                            <input type="button" class="Content__Detailed__Category" value="公益" />
                            <input type="button" class="Content__Detailed__Category" value="公开课" />
                            <input type="button" class="Content__Detailed__Category" value="音乐" />
                            <input type="button" class="Content__Detailed__Category" value="农业" />
                        </p>
                        <p>
                            <span>项目地点：</span>
                            <select id="SelectProvince">
                                <option>广西</option>
                            </select>
                            <select id="SelectCity">
                                <option>南宁</option>
                            </select>
                        </p>
                        <p>
                            <span>项目封面：</span>
                            <input type="file" id="Content__Detailed__Cover" value="上传封面" />
                        </p>
                        <p>
                            <span>视频：</span>
                            <input type="text" name="name" value="" placeholder="请输入视频播放地址" />
                        </p>
                        <p>
                            <span>项目简介：</span>
                            <textarea id="taSynopsis" cols="40" rows="5" placeholder="不超过75个字"></textarea>
                        </p>
                        <p>
                            <span>项目详情：</span>
                            <textarea id="taDetails" cols="80" rows="20" placeholder="项目详细信息"></textarea>
                        </p>
                        <p>
                            <span>标签：</span>
                            <input type="text" id="Content__Detailed__Label" value="" placeholder="请使用逗号或空格分隔不同标签" />
                        </p>
                        <p>
                            <a href="#">
                                <input type="button" class="NextStep" onclick="hideClick()" value="下一步" /></a>
                        </p>
                    </div>
                </div>
                <%-- 右边的草稿图 --%>
                <div class="ProjectInformation_Content__Img"></div>
            </div>
        </div>

        <%-- 回报设置 --%>
        <div class="Content_container hide" id="ReturnSetting">
            <%-- 上面的进度条 --%>
            <div class="ProjectInformation_Content__SpeedOfProgress">
                <span class="SpeedOfProgress__span">项目信息</span>
                <span class="SpeedOfProgress__span">回报设置</span>
                <span>发起人信息</span>
                <span>完成</span>
            </div>
            <%-- 下面的内容 --%>
            <div class="ReturnSetting_Content__ReturnSetting">
                <%-- 左边的内容 --%>
                <div class="ReturnSetting_Content__Setting">
                    <div class="ReturnSetting_Content__Title">回报设置</div>
                    <%-- 详细信息 --%>
                    <div class="ReturnSetting_Content__Detailed">
                        <table class="Content__Detailed__Table">
                            <tr>
                                <td>回报</td>
                                <td>支付金额</td>
                                <td>名额</td>
                                <td>回报内容</td>
                                <td>回报时间</td>
                                <td>运费</td>
                                <td>操作</td>
                            </tr>
                        </table>
                        <%-- 支持回报选项02 --%>
                        <div class="ReturnSetting_Content__ReturnOptions__Title">
                            支持回报选项02
                        </div>
                        <div class="ReturnSetting_Content__ReturnOptions">
                            <p>
                                <span>支持金额：</span>
                                <input type="text" name="name" value="" />元
                            </p>
                            <p>
                                <span>回报内容：</span>
                                <textarea id="ReturnOptions__tea" cols="80" rows="20" placeholder="请填写关于回报或任何你希望项目发起人知道的信息，不多于500字"></textarea>
                            </p>
                            <p>
                                <span>说明图片：</span>
                                <span class="span_explain">支持jpg，jpeg，png，gif格式，大小不超过500kb，最多上传3张</span><br />
                                <input type="file" name="name" value="" />
                            </p>
                            <p>
                                <span>限定名额：</span>
                                <input type="text" name="name" value="0" />个
                            <span class="span_explain">“0”为不限制名额</span>
                            </p>
                            <p>
                                <span>运费：</span>
                                <input type="text" name="name" value="0" />元
                            <span class="span_explain">“0”为不收取运费</span>
                            </p>
                            <p>
                                <span>回报时间：</span><span>项目结束后</span>
                                <input type="text" name="name" value="" />天
                            </p>
                            <p>
                                <input type="button" id="save" class="Save" value="保存" />
                                <input type="button" id="nosave" class="Save" value="取消保存" />
                            </p>
                            <p>
                                <a href="#">
                                    <input type="button" id="NextStep" class="NextStep" onclick="nextClick()" value="下一步" /></a>
                                <a href="#">
                                    <input type="button" id="LastStep" class="NextStep" onclick="upperClick()" value="上一步" /></a>
                            </p>
                        </div>
                    </div>
                </div>
                <%-- 右边的温馨提示 --%>
                <div class="ReturnSetting_Content__Reminder">
                    <div class="Reminder__div">温馨提示</div>
                    <p>
                        <span class="Reminder_span">三个以上的回报</span><br />
                        <span class="Reminder_span__content">多些选择能提高项目的支持率</span><br />
                    </p>
                    <p>
                        <span class="Reminder_span">几十、几百、上千元的支持</span><br />
                        <span class="Reminder_span__content">三个不同档次的回报，能让你的项</span><br />
                        <span class="Reminder_span__content">目 更快成功</span><br />
                    </p>
                    <p>
                        <span class="Reminder_span">回报最好是项目最好的衍生品</span><br />
                        <span class="Reminder_span__content">多些选择能提高项目的支持率</span><br />
                        <span class="Reminder_span__content">大家的支持</span><br />
                    </p>

                </div>
            </div>
        </div>

        <%-- 发起人信息 --%>
        <div class="Content_container hide" id="SponsorInformation">
            <%-- 上面的进度条 --%>
            <div class="ProjectInformation_Content__SpeedOfProgress">
                <span class="SpeedOfProgress__span">项目信息</span>
                <span class="SpeedOfProgress__span">回报设置</span>
                <span class="SpeedOfProgress__span">发起人信息</span>
                <span>完成</span>
            </div>
            <%-- 下面的内容 --%>
            <div class="SponsorInformation_Content__Sponsor">
                <%-- 左边的详细信息 --%>
                <div class="Content__Sponsor__left">
                    <div class="Sponsor__left__Title">
                        发起人信息
                    </div>
                    <div class="Content__Sponsor__Information">
                        <p>
                            <span class="Sponsor_span">真实姓名：</span>
                            <input type="text" name="name" value="" />
                        </p>
                        <p>
                            <span class="Sponsor_span">所在地：</span>
                            <select id="AddressProvince">
                                <option>湖北</option>
                            </select>
                            <select id="AddressCity">
                                <option>武汉</option>
                            </select>
                        </p>
                        <p>
                            <span class="Sponsor_span">移动电话：</span>
                            <input type="text" name="name" value="" />
                        </p>
                        <p>
                            <span class="Sponsor_supplement">补充打款信息</span>
                        </p>
                        <p>
                            <span class="Sponsor_span">银行名称：</span>
                            <input type="text" name="name" value="" />
                        </p>
                        <p>
                            <span class="Sponsor_span">开户支行：</span>
                            <input type="text" name="name" value="" />
                        </p>
                        <p>
                            <span class="Sponsor_span">开户名称：</span>
                            <input type="text" name="name" value="" />
                        </p>
                        <p>
                            <span class="Sponsor_span">银行账号：</span>
                            <input type="text" name="name" value="" />
                        </p>
                    </div>
                    <div class="Content__Sponsor__btn">
                        <a href="#">
                            <input type="button" class="Sponsor_btn" value="上一步" onclick="Sponsor_Click()" /></a>
                        <a href="#">
                            <input type="button" class="Sponsor_btn" value="保存草稿" /></a>
                        <a href="#">
                            <input type="button" class="Sponsor_btn" value="提交审核" onclick="Submit_Click()" /></a>
                    </div>
                </div>
                <%-- 右边的温馨提示 --%>
                <div class="Content__Sponsor__Reminder">
                    <div class="Reminder__div">温馨提示</div>
                    <p>
                        <span class="Reminder_span__content">请仔细填写本页信息，确保项目成</span><br />
                        <span class="Reminder_span__content">功后能快速并准确的为您打赏</span>
                    </p>
                </div>
            </div>
        </div>

        <%-- 完成 --%>
        <div class="Content_container hide" id="complete">
            <%-- 上面的进度条 --%>
            <div class="ProjectInformation_Content__SpeedOfProgress">
                <span class="SpeedOfProgress__span">项目信息</span>
                <span class="SpeedOfProgress__span">回报设置</span>
                <span class="SpeedOfProgress__span">发起人信息</span>
                <span class="SpeedOfProgress__span">完成</span>
            </div>
            <div class="complete_div">
                <img src="/Material/完成.png" />
                <span>项目已提交，请耐心等待审核</span>
            </div>
        </div>
    </section>

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

    <script>
        //判断是否同意《服务协议》
        var cbID = document.getElementById("#cbAgree");//获取id
        //按钮《立即发起项目》的点击事件
        $(function () {
            $("#btnEstablish").click(function () {
                var agree = $("#cbAgree").is(":checked");
                if (agree) {
                    //显示项目信息并隐藏新建项目
                    $(".launch").addClass("hide");
                    $("#ProjectInformation").removeClass("hide");
                }
                else {
                    alert("请阅读并同意《服务协议》和《众筹公告》");
                }
            });
        });
        //隐藏项目信息并显示项目回报
        function hideClick() {
            $("#ProjectInformation").addClass("hide");
            $("#ReturnSetting").removeClass("hide");
        }
        //项目回报中的上一步
        function upperClick() {
            $("#ProjectInformation").removeClass("hide");
            $("#ReturnSetting").addClass("hide");
        }
        //回报设置的下一步
        function nextClick() {
            //隐藏回报设置并显示发起人信息
            $("#ReturnSetting").addClass("hide");
            $("#SponsorInformation").removeClass("hide");
        }
        //发起人信息的上一步
        function Sponsor_Click() {
            $("#SponsorInformation").addClass("hide");
            $("#ReturnSetting").removeClass("hide");
        }
        //提交审核
        function Submit_Click() {
            $("#SponsorInformation").addClass("hide");
            $("#complete").removeClass("hide");
        }

    </script>
</body>
</html>
