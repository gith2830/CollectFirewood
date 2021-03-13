<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="CollectFirewood.Member.UserRegister" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
    <link href="../Content/Css/LoginandRegister.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 40px;
        }
    </style>
</head>
<body>
    <header id="header">
        <div class="header grid">
            <div class="logo grid-cell-6">
                <img src="../Material/logo3.png" />
            </div>
            <div class="record grid-cell-1">
                <span>已有账号</span>
                <a href="UserLogin.aspx">直接登录</a>
            </div>
        </div>
        <div class="xian"></div>
    </header>
    <footer id="footer">
        <div class="logo2 grid">
            <div class="grid-cell-1">
                <img src="../Material/logo4.png" />
            </div>
            <div class="grid-cell-2">
                <div class="bigbox">
                    <span class="span">用户注册</span><br>
                    <form runat="server" method="post">
                        <table >
                        <tr>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入手机号" ControlToValidate="userphone" ForeColor="Red">*</asp:RequiredFieldValidator>手机号:</td>
                            <td><asp:TextBox ID="userphone" runat="server" CssClass="textbox"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="请输入正确的手机格式" ControlToValidate="userphone" ForeColor="Red" ValidationExpression="^[0-9]{11,11}$">*</asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请输入昵称" ControlToValidate="nickname" ForeColor="Red">*</asp:RequiredFieldValidator>昵称:</td>
                            <td><asp:TextBox ID="nickname" runat="server" CssClass="textbox"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="请输入账号" ControlToValidate="username" ForeColor="Red">*</asp:RequiredFieldValidator>账号:</td>
                            <td class="auto-style1"><asp:TextBox ID="username" runat="server" CssClass="textbox"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="请输入密码" ControlToValidate="password" ForeColor="Red">*</asp:RequiredFieldValidator>密码:</td>
                            <td><asp:TextBox ID="password" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="请确认密码是否正确" ControlToValidate="repassword" ForeColor="Red">*</asp:RequiredFieldValidator>确认密码:</td>
                            <td><asp:TextBox ID="repassword" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次密码输入不一致" ControlToCompare="password" ControlToValidate="repassword" ForeColor="Red">*</asp:CompareValidator>
                            </td>
                        </tr>
                            <tr>
                                <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="请选择" ControlToValidate="RadioButtonList1" ForeColor="Red">*</asp:RequiredFieldValidator>性别:
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="16px" RepeatDirection="Horizontal">
                                        <asp:ListItem Selected="True">男</asp:ListItem>
                                        <asp:ListItem>女</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="请输入验证码" ControlToValidate="numbercode" ForeColor="Red">*</asp:RequiredFieldValidator>验证码:</td>
                            <td class="auto-style1"><asp:TextBox ID="numbercode" runat="server" CssClass="textbox"></asp:TextBox><asp:Label ID="getnumbercode" runat="server" Text="000" ForeColor="#FF99FF"></asp:Label></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="agreement">
                                <asp:CheckBox ID="checkbox" runat="server" />阅读并同意众筹网的<a href="#">《服务协议》</a></td>
                        </tr>
                            <tr>
                            <td></td>
                            <td>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><asp:Button ID="btnRegister" runat="server" Text="注册" CssClass="btnRegister" OnClick="btnRegister_Click" /></td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
