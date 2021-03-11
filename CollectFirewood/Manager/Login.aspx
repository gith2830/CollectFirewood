<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CollectFirewood.Manager.Login" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/Content/Css/Login.css">
    <link rel="stylesheet" href="/Content/Css/common.css">
    <link rel="stylesheet" href="/Content/Css/ui.css">
    <script src="/Content/Js/jquery-3.3.1.min.js"></script>
</head>
<body>
    <div class="login_container">
        <div class="login_box">
            <!-- 头像区域 -->
            <div class="avatar_box">
                <img src="/Content/Img/user-icon.jpg" alt="">
            </div>
            <!-- 登录表单区域 -->
            <form action="" runat="server" method="post" class="login_form">
                <div><input type="text" name="txtName" class="txt"></div>
                <div><input type="password" name="txtPwd" class="txt"></div>
                <div class="btn-box">
                    <input type="button" value="登录" name="" id="login-btn" class="button btn_huge btn_success">
                    <input type="button" value="重置" name="" class="button btn_huge btn_default">
                </div>
            </form>
        </div>
    </div>
    <!-- 消息框 -->
    <script src="/Content/Js/ui.js"></script>
    <script>
        $("#login-btn").click(function () {
            var userName = $("[name='txtName']").val();
            var userPwd = $("[name='txtPwd']").val();
            $.post("/Ashx/Admin/AdminLogin.ashx", { "txtName": userName, "txtPwd": userPwd }, function (data) {
                console.log(data);
                var serverData = data.split(":");
                if (serverData[0] == "ok") {
                    window.location = "https://localhost:44324/Manager/Index.aspx";
                } else {
                    var message = new Message();
                    message.danger("登录失败:" + serverData[1]);
                }
            });
        });
    </script>
</body>
</html>
