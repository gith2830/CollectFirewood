<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MainMaster.Master" AutoEventWireup="true" CodeBehind="Userinfo.aspx.cs" Inherits="CollectFirewood.Member.UserInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <link rel="stylesheet" href="/Content/Css/userInfo.css" />
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
            <div class="menu_item"><span class="iconfont icon-image"></span>其他修改</div>
            <%--<div class="menu_item"><span class="iconfont icon-iconfontlinjuquan"></span>收件地址</div>--%>
            <div class="menu_item"><span class="iconfont icon-Icon_Filled_jiaoyan"></span>审批中项目</div>
        </div>
        <div class="menu_setting">
            <table class="modifiedBox_item">
                <tr class="tab_item">
                    <td><span class="tab_item-label">用户名:</span></td>
                    <td>&nbsp;&nbsp;<asp:TextBox ID="Nickname" CssClass="Sponsor_information" runat="server"></asp:TextBox><br>
                    </td>
                </tr>
                <tr class="tab_item">
                    <td></td>
                    <td><span class="tab_item-msg">用户名三十天内只可以修改一次</span></td>
                </tr>
                <tr class="tab_item">
                    <td><span>性别:</span></td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonListOfSex" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True">男</asp:ListItem>
                            <asp:ListItem>女</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr class="tab_item">
                    <td><span>所在地:</span></td>
                    <td>&nbsp;&nbsp;<asp:TextBox ID="Info_Address" CssClass="Sponsor_information" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>请输入手机号码:</td>
                    <td>&nbsp;&nbsp;<asp:TextBox ID="Info_Phone" CssClass="Sponsor_information" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="tab_item">
                    <td></td>
                    <td>
                        <asp:Button ID="UpdateOfInfo" runat="server" Text="确认修改" CssClass="btn_save" OnClick="UpdateOfInfo_Click" /></td>
                </tr>
            </table>
            <table class="modifiedBox_item">
                <tr>
                    <td>请输入新密码:</td>
                    <td>&nbsp;&nbsp;<asp:TextBox ID="NewPassWord" CssClass="Sponsor_information" TextMode="Password" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>确认您的密码:</td>
                    <td>&nbsp;&nbsp;<asp:TextBox ID="ConfirmPassword" CssClass="Sponsor_information" TextMode="Password" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>请输入手机号码:</td>
                    <td>&nbsp;&nbsp;<asp:TextBox ID="PassWord_PhoneNumber" CssClass="Sponsor_information" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="BtnOfUpdatePassWord" runat="server" Text="确认修改" CssClass="btn_save" OnClick="BtnOfUpdatePassWord_Click" /></td>
                </tr>
            </table>
            <table class="modifiedBox_item">
                <tr class="tab_item">
                    <td>头像修改</td>
                    <td>&nbsp;&nbsp;<asp:FileUpload ID="Content__Detailed__Cover1" CssClass="Content__Detailed__Cover" runat="server" /></td>
                </tr>
                <tr class="tab_item">
                    <td><span>个人说明:</span></td>
                    <td>&nbsp;&nbsp;<asp:TextBox ID="Description" TextMode="MultiLine" runat="server" Style="width: 300px; height: 80px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>手机号码:</td>
                    <td>&nbsp;&nbsp;<asp:TextBox ID="Other_Phone" CssClass="Sponsor_information" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="BtnOfUpdate" runat="server" Text="确认修改" CssClass="btn_save" OnClick="BtnOfUpdate_Click" /></td>
                </tr>
            </table>
            <%-- <table class="modifiedBox_item">
                <tr class="tab_item">
                    <td>收件地址管理</td>
                </tr>
                 <tr>
                    <td>请输入新地址:</td>    
                     <td>&nbsp;&nbsp;<asp:TextBox ID="Address" CssClass="Sponsor_information" TextMode="Password" runat="server"></asp:TextBox></td>
                </tr>               
                 <tr>
                    <td>请输入手机号码:</td>    
                     <td>&nbsp;&nbsp;<asp:TextBox ID="Address_Phone" CssClass="Sponsor_information" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Button ID="BtnOfAddress" runat="server"  Text="确认修改"  CssClass="btn_save" OnClick="BtnOfAddress_Click"/></td>
                </tr>
            </table>--%>
            <ul>
                <li></li>
            </ul>
            <table class="modifiedBox_item" border="1">
                <tr>
                    <td>您发表的项目</td>
                    <td>项目目标金额</td>
                    <td>项目截至日期</td>
                    <td>地址</td>
                </tr>           
                <asp:Repeater ID="RepeaterProject" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("ProjectName") %></td>
                            <td><%# Math.Floor(Convert.ToDecimal(Eval("Goal")))%></td>
                            <td><%# Eval("DeadLine") %></td> 
                            <td><%# Eval("Address") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>
</asp:Content>
