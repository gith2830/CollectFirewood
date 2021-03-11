<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MainMaster.Master" AutoEventWireup="true" CodeBehind="Userinfo.aspx.cs" Inherits="CollectFirewood.Member.UserInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <link rel="stylesheet" href="/Content/Css/userInfo.css"/>
    <script src="/Content/Js/jquery-3.3.1.min.js"></script>
    <script>
        $(function () {
            $(".menu_item").click(function () {
                $(this).addClass("menu_item--active").siblings().removeClass("menu_item--active");
                var index = $(this).index();
                $(".modifiedBox_item").eq(index).show().siblings().hide();
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="title_box"><span class="title">个人设置</span><a href="UserHomePage.aspx" class="return-user">返回个人中心</a></div>
    <div class="userinfo_box">
        <div class="menu_box">
            <div class="menu_item menu_item--active"><span class="iconfont icon-shiyanshirenyuan"></span>资料修改</div>
            <div class="menu_item"><span class="iconfont icon-ic24-lock"></span>密码修改</div>
            <div class="menu_item"><span class="iconfont icon-image"></span>头像修改</div>
            <div class="menu_item"><span class="iconfont icon-iconfontlinjuquan"></span>收件地址罐头</div>
            <div class="menu_item"><span class="iconfont icon-Icon_Filled_jiaoyan"></span>我的优惠券</div>
        </div>
        <div class="menu_setting">
            <table class="modifiedBox_item">
                <tr class="tab_item">
                    <td><span class="tab_item-label">手机:</span></td>
                    <td><span class="tab_item-label">18674001693</span></td>
                </tr>
                <tr class="tab_item">
                    <td><span class="tab_item-label">用户名:</span></td>
                    <td><input type="text"><br></td>
                </tr>
                <tr class="tab_item">
                    <td></td>
                    <td><span class="tab_item-msg">用户名三十天内只可以修改一次</span></td>
                </tr>
                <tr class="tab_item">
                    <td><span>性别:</span></td>
                    <td><input type="radio">男 <input type="radio">女 <input type="radio">保密</td>
                </tr>
                <tr class="tab_item">
                    <td><span>所在地:</span></td>
                    <td>
                        <select name="" id=""><option>湖北</option></select>
                        <select name="" id=""><option>武汉</option></select>
                    </td>
                </tr>
                <tr class="tab_item">
                    <td><span>网址:</span></td>
                    <td><input type="text"></td>
                </tr>
                <tr class="tab_item">
                    <td><span>个人说明:</span></td>
                    <td>
                        <textarea name="" id="" cols="30" rows="10"></textarea><br>
                    </td>
                </tr>
                <tr class="tab_item">
                    <td></td>
                    <td>
                        <button type="button" class="btn_save">保存</button>
                    </td>
                </tr>
            </table>
            <table class="modifiedBox_item">
                <tr>
                    <td>密码修改</td>
                </tr>
            </table>
            <table class="modifiedBox_item">
                <tr class="tab_item">
                    <td>头像修改</td>
                </tr>
            </table>
            <table class="modifiedBox_item">
                <tr class="tab_item">
                    <td>收件地址管理</td>
                </tr>
            </table>
            <table class="modifiedBox_item">
                <tr class="tab_item">
                    <td>我的优惠券</td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
