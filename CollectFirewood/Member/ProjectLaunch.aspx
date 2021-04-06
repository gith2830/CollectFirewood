<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectLaunch.aspx.cs" Inherits="CollectFirewood.Member.ProjectLaunch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>项目发布</title>
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
                                        <asp:TextBox ID="Content__Detailed__inputName" class="NoNullTestOfProjectInformation" CssClass="Content__Detailed__inputName " placeholder="请输入名称" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Content__Detailed__inputName" runat="server" ErrorMessage="请输入项目名">*</asp:RequiredFieldValidator>
                                    </p>
                                    <p>                  
                                        <span class="ProjectInformation_Content__Detailed__span">筹资金额：</span>
                                        <asp:TextBox ID="Content__Detailed__inputMoney" class="NoNullTestOfProjectInformation" CssClass="Content__Detailed__inputMoney" runat="server" placeholder="请输入金额"></asp:TextBox>元
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Content__Detailed__inputMoney" runat="server" ErrorMessage="请输入金额">*</asp:RequiredFieldValidator>
                                         
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="请输入正确的金额" ControlToValidate="Content__Detailed__inputMoney" ValidationExpression="^[0-9]*[1-9][0-9]*$">*</asp:RegularExpressionValidator>
                                        
                                    </p>
                                    <p>
                                        <span class="ProjectInformation_Content__Detailed__span">筹集天数：</span>    
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="请输入正确的天数" ControlToValidate="Content__Detailed__inputDay" ValidationExpression="^[0-9]*[1-9][0-9]*$">*</asp:RegularExpressionValidator>
                                        <asp:TextBox ID="Content__Detailed__inputDay" class="NoNullTestOfProjectInformation" CssClass="Content__Detailed__inputDay" placeholder="天数" runat="server"></asp:TextBox>
                                        天
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="Content__Detailed__inputDay" runat="server" ErrorMessage="请输入天数">*</asp:RequiredFieldValidator>
                                    </p>
                                    <p>
                                        <span class="ProjectInformation_Content__Detailed__span">类别：</span>
                                        <%-- <input type="button" class="Content__Detailed__Category" value="科技" />
                                        <input type="button" class="Content__Detailed__Category" value="艺术" />
                                        <input type="button" class="Content__Detailed__Category" value="设计" />
                                        <input type="button" class="Content__Detailed__Category" value="影视" />
                                        <input type="button" class="Content__Detailed__Category" value="出版" />
                                        <input type="button" class="Content__Detailed__Category" value="动漫" />
                                        <input type="button" class="Content__Detailed__Category" value="公益" />
                                        <input type="button" class="Content__Detailed__Category" value="公开课" />
                                        <input type="button" class="Content__Detailed__Category" value="音乐" />
                                        <input type="button" class="Content__Detailed__Category" value="农业" />--%>
                                        <asp:DropDownList ID="DropDownListByTypes" CssClass="ProjectInformation_ddl" runat="server">
                                            <asp:ListItem Value="10000">科技</asp:ListItem>
                                            <asp:ListItem Value="10001">艺术</asp:ListItem>
                                            <asp:ListItem Value="10002">设计</asp:ListItem>
                                            <asp:ListItem Value="10003">音乐</asp:ListItem>
                                            <asp:ListItem Value="10004">影视</asp:ListItem>
                                            <asp:ListItem Value="10005">出版</asp:ListItem>
                                            <asp:ListItem Value="10006">动漫</asp:ListItem>
                                            <asp:ListItem Value="10007">公益</asp:ListItem>
                                            <asp:ListItem Value="10008">公开课</asp:ListItem>
                                            <asp:ListItem Value="10009">农业</asp:ListItem>
                                            <asp:ListItem Value="10010">苏州站</asp:ListItem>
                                            <asp:ListItem Value="10011">其他</asp:ListItem>
                                        </asp:DropDownList>
                                    </p>
                                    <p>
                                        <span class="ProjectInformation_Content__Detailed__span">项目地点：</span>
                                        <asp:TextBox ID="Content__Detailed__Address" class="NoNullTestOfProjectInformation" CssClass="Content__Detailed__inputName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="Content__Detailed__Address" ID="RequiredFieldValidator4" runat="server" ErrorMessage="请输入项目地点">*</asp:RequiredFieldValidator>
                                    </p>
                                    <p>
                                        <span class="ProjectInformation_Content__Detailed__span">项目封面：</span>
                                        <asp:FileUpload ID="Content__Detailed__Cover" CssClass="Content__Detailed__Cover" runat="server" />
                                        <span class="Cover_span">支持jpg、png格式</span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ControlToValidate="Content__Detailed__Cover" runat="server" ErrorMessage="请选择图片">*</asp:RequiredFieldValidator>
                                    </p>  
                                    <p><span class="ProjectInformation_Content__Detailed__span">项目详情：</span> </p>
                                    <p>                                                                            
                                        <asp:TextBox ID="Content__Detailed__Details" class="NoNullTestOfProjectInformation" CssClass="Content__Detailed__Details" TextMode="MultiLine" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="Content__Detailed__Details" runat="server" ErrorMessage="请输入详情">*</asp:RequiredFieldValidator>
                                    </p>
                                    <p>
                                        <input type="button" id="button" value="下一步"  class="NextStep"/>
                                    </p>
                                </div>
                            </div>
                            <%-- 右边的草稿图 --%>
                            <div class="ProjectInformation_Content__Img">
                                <div class="Img_thumbnail" >
                                    <img style="width:100%;height:100%;" src="../Material/logo4.png" />
                                </div>
                                <div class="Img_target">
                                    大胆写下你的想法
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
                                <%--        <p>
                                            <span>支持金额：</span>
                                            <asp:TextBox ID="TextBox2" CssClass="ReturnSetting_SupportAmount" runat="server"></asp:TextBox>
                                            元
                                        </p>--%>
                                        <p>
                                            <span>回报内容：</span>
                                            <asp:TextBox ID="TextBox3" TextMode="MultiLine" CssClass="ReturnOptions__tea" placeholder="支持￥>300￥<1000￥" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="TextBox3" runat="server" ErrorMessage="请输入你的回报">*</asp:RequiredFieldValidator>
                                        </p>
                                        <p>
                                            <span>回报内容：</span>
                                            <asp:TextBox ID="TextBox1" TextMode="MultiLine" CssClass="ReturnOptions__tea" placeholder="支持￥>1000￥<5000￥" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="TextBox1" runat="server" ErrorMessage="请输入你的回报">*</asp:RequiredFieldValidator>
                                        </p>
                                        <p>
                                            <span>回报内容：</span>
                                            <asp:TextBox ID="TextBox4" TextMode="MultiLine" CssClass="ReturnOptions__tea" placeholder="支持￥>=5000￥" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="TextBox4" runat="server" ErrorMessage="请输入你的回报">*</asp:RequiredFieldValidator>
                                        </p>
                           <%--             <p>
                                            <span>说明图片：</span>
                                            <span class="span_explain">支持jpg，jpeg，png，gif格式，大小不超过500kb，最多上传3张</span><br />
                                            <asp:FileUpload ID="FileUpload1" CssClass="ReturnSetting_ExplainImg" runat="server" />
                                        </p>--%>
<%--                                        <p>
                                            <span>限定名额：</span>
                                            <asp:TextBox ID="TextBox4" CssClass="ReturnSetting_Quota" Text="0" runat="server"></asp:TextBox>个
                                            <span class="span_explain">“0”为不限制名额</span>
                                        </p>--%>
                                        <p>
                                            <span>运费：</span>
                                            <asp:TextBox ID="TextBox5" CssClass="ReturnSetting_Freight" Text="0" runat="server"></asp:TextBox>元
                                            <span class="span_explain">“0”为不收取运费</span>
                                        </p>
                                        <p>
                                            <span>回报时间：</span><span>项目结束后</span>
                                            <asp:TextBox ID="TextBox6" CssClass="ReturnSetting_ProjectEnd" runat="server"></asp:TextBox>天
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="TextBox6" runat="server" ErrorMessage="请输入回报时间">*</asp:RequiredFieldValidator>
                                        </p>
                                        <%--                                        <div class="ReturnSetting_BtnSave">
                                            <asp:Button ID="Button1" CssClass="Save" runat="server" Text="保存" />
                                            <asp:Button ID="Button2" CssClass="Save" runat="server" Text="取消保存" />
                                        </div>--%>
                                        <p>
                                            <input type="button" id="Button3" value="下一步"  class="NextStep"/>
                                            <input type="button" id="Button4" value="上一步"  class="NextStep"/>
                                           <%-- <asp:Button ID="Button3" CssClass="NextStep" runat="server" Text="下一步" />
                                            <asp:Button ID="Button4" CssClass="NextStep" runat="server" Text="上一步" />--%>
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
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="TextBox7" runat="server" ErrorMessage="请输入姓名">*</asp:RequiredFieldValidator>
                                    </p>
                                    <p>
                                        <span class="Sponsor_span">所在地：</span>
                                        <asp:TextBox ID="UserAddress" CssClass="Sponsor_information" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="UserAddress" runat="server" ErrorMessage="请输入您的所在地">*</asp:RequiredFieldValidator>
                                    </p>
                                    <p>
                                        <span class="Sponsor_span">移动电话：</span>
                                        <asp:TextBox ID="TextBox8" CssClass="Sponsor_information" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="TextBox8" runat="server" ErrorMessage="请输入您的手机号码">*</asp:RequiredFieldValidator>
                                    </p>
                                    <p>
                                        <b class="Sponsor_supplement">补充打款信息</b>
                                    </p>
                                    <p>
                                        <span class="Sponsor_span">银行名称：</span>
                                        <asp:TextBox ID="TextBox9" CssClass="Sponsor_supplement__info" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="TextBox9" runat="server" ErrorMessage="请输入您的银行名称">*</asp:RequiredFieldValidator>
                                    </p>
                                    <p>
                                        <span class="Sponsor_span">开户支行：</span>
                                        <asp:TextBox ID="TextBox10" CssClass="Sponsor_supplement__info" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14"  ControlToValidate="TextBox10" runat="server" ErrorMessage="请输入支行">*</asp:RequiredFieldValidator>
                                    </p>
                                   <%-- <p>
                                        <span class="Sponsor_span">开户名称：</span>
                                        <asp:TextBox ID="TextBox11" CssClass="Sponsor_supplement__info" runat="server"></asp:TextBox>
                                    </p>--%>
                                    <p>
                                        <span class="Sponsor_span">银行账号：</span>
                                        <asp:TextBox ID="TextBox12" CssClass="Sponsor_supplement__info" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="TextBox12" runat="server" ErrorMessage="请输入银行账号">*</asp:RequiredFieldValidator>
                                    </p>
                                </div>
                                <div class="Content__Sponsor__btn">
                                    <input type="button" id="Button5" value="上一步"  class="Sponsor_btn"/>
                                    <asp:Button ID="Button6" Text="提交审核" class="Sponsor_btn" runat="server" OnClick="Button6_Click"  UseSubmitBehavior="False" />
                                </div>
                               
                            </div>

                            <%-- 右边的温馨提示 --%>
                            <div class="Content__Sponsor__Reminder">
                                <div class="Reminder__div">温馨提示</div>
                                <p>
                                    <span class="Reminder_span__content">请仔细填写本页信息，确保项目成</span><br />
                                    <span class="Reminder_span__content">功后能快速并准确的为您打赏</span>
                                     <p>
                                         <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                            </div>
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
            //项目信息下一步
            $("#button").click(function () {
                $("#ProjectInformation").hide();
                $("#ReturnSetting").show();
                return false;
            });
            //回报设置的上一步
            $("#Button4").click(function () {
                $("#ReturnSetting").hide();
                $("#ProjectInformation").show();
                return false;
            });
            //回报设置的下一步
            $("#Button3").click(function () {
                $("#ReturnSetting").hide();
                $("#SponsorInformation").show();
                return false;
            });
            //发起人的上一步
            $("#Button5").click(function () {
                $("#SponsorInformation").hide();
                $("#ReturnSetting").show();
                return false;
            });
        });

    </script>
</body>
</html>
