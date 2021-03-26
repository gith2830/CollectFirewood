<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="CollectFirewood.Member.UserLogin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
    <link href="../Content/Css/LoginandRegister.css" rel="stylesheet" />
</head>
<body>
    <header id="header">
        <div class="header grid">
            <div class="logo grid-cell-6">
                <img src="../Material/logo3.png" />
            </div>
            <div class="record grid-cell-1">
                <span>没有账号</span>
                <a href="UserRegister.aspx">点击注册</a>
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
                <form action="" method="post" runat="server">
                    <div class="bigbox " style="height: 250px;">
                    <span class="span">用户登录</span><br>
                    <table >
                        <tr>
                            <td>账号:</td>
                            <td><asp:TextBox ID="username" runat="server" CssClass="textbox"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>密码:</td>
                            <td><asp:TextBox ID="password" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="agreement"><asp:CheckBox ID="checkbox" runat="server" />阅读并同意众筹网的<a href="#">《服务协议》</a></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txt_ValidateCode" runat="server"></asp:TextBox>
                            </td>
                            <td><img src="/Ashx/ValidateCode.ashx"/></td>
                        </tr>
                        <tr>
                            <td><asp:Button ID="btnLogin" runat="server" Text="登录" CssClass="btnLogin" OnClick="btnLogin_Click" /></td>
                        </tr>
                    </table>

                </div>
                </form>
            </div>
        </div>
    </footer>
</body>
</html>

