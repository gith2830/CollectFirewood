<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="CollectFirewood.Member.UserRegister" %>

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
                    <table >
                        <tr>
                            <td>手机号:</td>
                            <td><input type="text" class="textbox"></td>
                        </tr>
                        <tr>
                            <td>昵称:</td>
                            <td><input type="text" class="textbox"></td>
                        </tr>
                        <tr>
                            <td>账号:</td>
                            <td><input type="text" class="textbox"></td>
                        </tr>
                        <tr>
                            <td>密码:</td>
                            <td><input type="text" class="textbox"></td>
                        </tr>
                        <tr>
                            <td>确认密码:</td>
                            <td><input type="text" class="textbox"> </td>
                        </tr>
                        <tr>
                            <td>手机验证:</td>
                            <td><input type="text" class="textbox"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="agreement"><input type="checkbox" name="" id="">阅读并同意众筹网的<a href="#">《服务协议》</a></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="button" class="btnRegister" value="立即注册"></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
