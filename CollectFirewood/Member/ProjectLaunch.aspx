
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
    <form action="" method="post" runat="server">
        <!-- 头部 -->
        <header class="top ">
            <div class="middle grid">
                <div class="top-logobox grid-cell-1">
                    <img src="/Material/logo.png" alt="">
                </div>
                <div class="top-listbox grid-cell-1">
                    <ul>
                        <li><a href="#">首页</a></li>
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
                <div id="Extablish">
                    <%-- 新建项目 --%>
                    <div class="start ">
                        <div class="start_span">
                            <span>发起项目</span>
                        </div>
                        <div class="start_content">
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
                                    <asp:CheckBox ID="cbAgree" runat="server" />
                                    <label for="cbAgree">阅读并同意众筹网的</label>
                                    <a href="#">《服务协议》</a><a href="#">《众筹公告》</a>
                                </p>
                                <p>
                                    <input type="button" value="发起项目" class="establishBtn" />
                                </p>
                            </div>
                        </div>
                    </div>

                    <%-- 项目信息 --%>
                    <div class="Content_container" id="ProjectInformation" style="display: none;">
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
                                        <span class="ProjectInformation_Content__Detailed__span">项目名称：</span>
                                        <asp:TextBox ID="Content__Detailed__inputName" CssClass="Content__Detailed__inputName" placeholder="名称不可超过40个字" runat="server"></asp:TextBox>
                                    </p>
                                    <p>
                                        <span class="ProjectInformation_Content__Detailed__span">筹资金额：</span>
                                        <asp:TextBox ID="Content__Detailed__inputMoney" CssClass="Content__Detailed__inputMoney" runat="server" placeholder="不少于500元"></asp:TextBox>
                                        天
                                    </p>
                                    <p>
                                        <span class="ProjectInformation_Content__Detailed__span">筹集天数：</span>
                                        <asp:TextBox ID="Content__Detailed__inputDay" CssClass="Content__Detailed__inputDay" placeholder="10~90天" runat="server"></asp:TextBox>
                                        天
                                    </p>
                                    <p>
                                        <span class="ProjectInformation_Content__Detailed__span">类别：</span><br />
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
                                        <span class="ProjectInformation_Content__Detailed__span">项目地点：</span>
                                        <asp:DropDownList ID="Content__Detailed__province" CssClass="ProjectInformation_ddl" runat="server">
                                            <asp:ListItem>请选择省份</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="Content__Detailed__city" CssClass="ProjectInformation_ddl" runat="server">
                                            <asp:ListItem>请选择城市</asp:ListItem>
                                        </asp:DropDownList>
                                    </p>
                                    <p>
                                        <span class="ProjectInformation_Content__Detailed__span">项目封面：</span>
                                        <asp:FileUpload ID="Content__Detailed__Cover" CssClass="Content__Detailed__Cover" runat="server" />
                                        <span class="Cover_span">支持jpg、jpeg、png、gif格式</span>
                                    </p>
                                    <p>
                                        <span class="ProjectInformation_Content__Detailed__span">视频：</span>
                                        <asp:FileUpload ID="Content__Detailed__video" CssClass="Content__Detailed__video" runat="server" placeholder="请输入视频播放地址" />
                                    </p>
                                    <p>
                                        <span class="ProjectInformation_Content__Detailed__span">项目简介：</span>
                                        <asp:TextBox ID="Content__Detailed__synopsis" CssClass="Content__Detailed__synopsis" TextMode="MultiLine" placeholder="不超过75个字" runat="server"></asp:TextBox>
                                    </p>
                                    <p>
                                        <span class="ProjectInformation_Content__Detailed__span">项目详情：</span>
                                        <asp:TextBox ID="Content__Detailed__Details" CssClass="Content__Detailed__Details" TextMode="MultiLine" runat="server"></asp:TextBox>
                                    </p>
                                    <p>
                                        <span class="ProjectInformation_Content__Detailed__span">标签：</span>
                                        <asp:TextBox ID="TextBox1" CssClass="Content__Detailed__Label" placeholder="请使用逗号或空格分隔不同标签" runat="server"></asp:TextBox>
                                    </p>
                                    <p>

                                        <input type="button" id="button" class="NextStep" value="下一步" />

                                    </p>
                                </div>
                            </div>
                            <%-- 右边的草稿图 --%>
                            <div class="ProjectInformation_Content__Img">
                                <div class="Img_thumbnail">
                                    缩略图
                                </div>
                                <div class="Img_target">
                                    目标：
                                </div>
                            </div>
                        </div>
                    </div>

                    <%-- 回报设置 --%>
                    <div class="Content_container" id="ReturnSetting" style="display: none">
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
                                            <asp:TextBox ID="TextBox2" CssClass="ReturnSetting_SupportAmount" runat="server"></asp:TextBox>
                                            元
                                        </p>
                                        <p>
                                            <span>回报内容：</span>
                                            <asp:TextBox ID="TextBox3" TextMode="MultiLine" CssClass="ReturnOptions__tea" placeholder="请填写关于回报或任何你希望项目发起人知道的信息，不多于500字" runat="server"></asp:TextBox>
                                        </p>
                                        <p>
                                            <span>说明图片：</span>
                                            <span class="span_explain">支持jpg，jpeg，png，gif格式，大小不超过500kb，最多上传3张</span><br />
                                            <asp:FileUpload ID="FileUpload1" CssClass="ReturnSetting_ExplainImg" runat="server" />
                                        </p>
                                        <p>
                                            <span>限定名额：</span>
                                            <asp:TextBox ID="TextBox4" CssClass="ReturnSetting_Quota" Text="0" runat="server"></asp:TextBox>个
                                <span class="span_explain">“0”为不限制名额</span>
                                        </p>
                                        <p>
                                            <span>运费：</span>
                                            <asp:TextBox ID="TextBox5" CssClass="ReturnSetting_Freight" Text="0" runat="server"></asp:TextBox>元
                            <span class="span_explain">“0”为不收取运费</span>
                                        </p>
                                        <p>
                                            <span>回报时间：</span><span>项目结束后</span>
                                            <asp:TextBox ID="TextBox6" CssClass="ReturnSetting_ProjectEnd" runat="server"></asp:TextBox>天
                                        </p>
                                        <div class="ReturnSetting_BtnSave">
                                            <asp:Button ID="Button1" CssClass="Save" runat="server" Text="保存" />
                                            <asp:Button ID="Button2" CssClass="Save" runat="server" Text="取消保存" />
                                        </div>
                                        <p>
                                            <asp:Button ID="Button3" CssClass="NextStep" runat="server" Text="下一步" />
                                            <asp:Button ID="Button4" CssClass="NextStep" runat="server" Text="上一步" />
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
                    <div class="Content_container" id="SponsorInformation" style="display: none">
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
                                        <asp:TextBox ID="TextBox7" CssClass="Sponsor_information" runat="server"></asp:TextBox>
                                    </p>
                                    <p>
                                        <span class="Sponsor_span">所在地：</span>
                                        <asp:DropDownList ID="DropDownList1" CssClass="Sponsor_informationAddress" runat="server">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="DropDownList2" CssClass="Sponsor_informationAddress" runat="server">
                                        </asp:DropDownList>
                                    </p>
                                    <p>
                                        <span class="Sponsor_span">移动电话：</span>
                                        <asp:TextBox ID="TextBox8" CssClass="Sponsor_information" runat="server"></asp:TextBox>
                                    </p>
                                    <p>
                                        <b class="Sponsor_supplement">补充打款信息</b>
                                    </p>
                                    <p>
                                        <span class="Sponsor_span">银行名称：</span>
                                        <asp:TextBox ID="TextBox9" CssClass="Sponsor_supplement__info" runat="server"></asp:TextBox>
                                    </p>
                                    <p>
                                        <span class="Sponsor_span">开户支行：</span>
                                        <asp:TextBox ID="TextBox10" CssClass="Sponsor_supplement__info" runat="server"></asp:TextBox>
                                    </p>
                                    <p>
                                        <span class="Sponsor_span">开户名称：</span>
                                        <asp:TextBox ID="TextBox11" CssClass="Sponsor_supplement__info" runat="server"></asp:TextBox>
                                    </p>
                                    <p>
                                        <span class="Sponsor_span">银行账号：</span>
                                        <asp:TextBox ID="TextBox12" CssClass="Sponsor_supplement__info" runat="server"></asp:TextBox>
                                    </p>
                                </div>
                                <div class="Content__Sponsor__btn">

                                    <input type="button" class="Sponsor_btn" value="上一步" />
                                    <asp:Button ID="Button5" runat="server" class="Sponsor_btn" Text="保存草稿" />
                                    <asp:Button ID="Button6" Text="提交审核" class="Sponsor_btn" runat="server" />
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
                    <div class="Content_container" id="complete" style="display: none">
                        <%-- 上面的进度条 --%>
                        <div class="ProjectInformation_Content__SpeedOfProgress">
                            <span class="SpeedOfProgress__span">项目信息</span>
                            <span class="SpeedOfProgress__span">回报设置</span>
                            <span class="SpeedOfProgress__span">发起人信息</span>
                            <span class="SpeedOfProgress__span">完成</span>
                        </div>
                        <div class="complete_div">
                            <img src="Images/完成.png" />
                            <span>项目已提交，请耐心等待审核</span>
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
    <script>

        //按钮《立即发起项目》的点击事件
        $(function () {
            $(".establishBtn").click(function () {
                var agree = $("#cbAgree").is(":checked");
                if (agree) {
                    //显示项目信息并隐藏新建项目
                    $(".start").hide();
                    $("#ProjectInformation").show();
                }
                else {
                    alert("请阅读并同意《服务协议》和《众筹公告》");
                }
            });
            $("#button").click(function () {
                $(".start").hide();
                $(".Content_container").hide();
                $("#ReturnSetting").show();
            });
            $("#Button4").click(function () {
                $(".start").hide();
                $(".Content_container").hide();
                $("#ProjectInformation").show();
            });
        });
        $(function () {

        });
        $(function () {

        });
        //获取高度
        var bodyHeight = window.innerHeight;
        document.querySelector("body").style.minHeight = bodyHeight + "px";
        //设置宽度
        var bodyWidth = screen.availWidth;
        document.querySelector("body").style.width = bodyWidth + "px";
        //设置导航栏点击事件样式
        $(function () {
            //设置鼠标点击事件
            $("li").click(function () {
                $("li").siblings("li").removeClass("li-add");
                $(this).addClass("li-add");
            });
        });
    </script>
</body>
</html>
