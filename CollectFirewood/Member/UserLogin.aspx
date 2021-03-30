<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="CollectFirewood.Member.UserLogin" %>

<%--<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
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
                    <div class="bigbox ">
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

                            <td>验证码:</td>
                            <td>
                                <asp:TextBox ID="txt_ValidateCode" CssClass="textbox" runat="server" style="float:left;"></asp:TextBox><img src="/Ashx/ValidateCode.ashx" style="float:left;"/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><asp:Button ID="btnLogin" runat="server" Text="登录" CssClass="btnLogin" OnClick="btnLogin_Click" /></td>
                        </tr>
                    </table>

                </div>
                </form>
            </div>
        </div>
    </footer>
</body>
</html>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>拾柴网登录界面</title>
    <link href="../Content/Css/Body.css" rel="stylesheet" />
    <script src="../Content/Js/jquery-1.7.2.js"></script>
    <script src="../Content/Js/ban.js"></script>
</head>
<body>
    <form action="" runat="server" method="post">
        <canvas class="cavs" width="1575" height="1337"></canvas>
<div class="loginmain">
    <div class="login-title">
        <span>拾柴网登录界面</span>
        <br />
        <span style="font-size:8px;">没有账号,<a href="UserRegister.aspx">点击注册</a></span>
    </div>

    <div class="login-con">
        <div class="login-user">
            <div class="icon">
                <img src="/Material/user_icon_copy.png" alt="">
            </div>
            <asp:TextBox ID="username" runat="server" placeholder="用户名" autocomplete="off"></asp:TextBox>
        </div>
        <div class="login-pwd">
            <div class="icon">
                <img src="/Material/lock_icon_copy.png" alt="">
            </div>
            <asp:TextBox ID="password" runat="server" placeholder="密码" TextMode="Password" autocomplete="off"></asp:TextBox>
        </div>
        <div class="login-yan">
            <div class="icon">
                <img src="/Material/key.png" alt="">
            </div>
            <asp:TextBox ID="txt_ValidateCode" CssClass="textbox" runat="server"  placeholder="验证码" ></asp:TextBox>
            <img src="/Ashx/ValidateCode.ashx" style="margin-left:350px;opacity:0.4;"/>
        </div>  
        <div>
             <asp:CheckBox ID="checkbox" runat="server" style="margin-left:65px;opacity:0.4;"/>阅读并同意众筹网的<a href="#">《服务协议》</a>
        </div>
        <div class="login-btn">
            <asp:Button ID="btnLogin" runat="server" Text="登录" OnClick="btnLogin_Click1"/>
        </div>
    </div>

</div>
    </form>

</body>
</html>

