<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admins.aspx.cs" Inherits="CollectFirewood.Manager.Components.Admins" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="/Content/Css/common.css"/>
    <link rel="stylesheet" href="/Content/Css/ui.css"/>
    <link rel="stylesheet" href="/Content/Css/iconfont.css"/>
    <link rel="stylesheet" href="/Content/Css/Components.css"/>
</head>
<body>
    <form runat="server">
        <div class="content">
            <div class="card">
                <button class="button btn_huge btn_append" type="button" onclick="showAddDialog()">添加</button>
                <div class="card__table-box">
                    <table cellspacing="0" cellpadding="0">
                        <tr class="table-header">
                            <td bind="Id">ID</td>
                            <td bind="AdminName">用户名</td>
                            <td bind="Pwd">密码</td>
                            <td bind="Id" onDelete="deleteAdmin" onEdit="showEditDialog">操作</td>
                        </tr>
                    </table>
                </div>
                <ul class="page-box">
                </ul>
            </div>
        </div>
        <div class="addDialog dialog-box">
            <div class="dialog-box__title">添加</div>
            <div class="dialog-box__content">
                <table>
                    <tr class="input-item"><td><span class="label-item label-name">名称:</span></td><td><input type="text" class="input-text input-name"/></td></tr>
                    <tr class="input-item"><td><span class="label-item label-pwd">密码:</span></td><td><input type="text" class="input-text input-pwd"/></td></tr>
                </table>
                <div class="btnBox">
                    <button class="button btn_huge btn_append" type="button" onclick="addAdmin()">添加</button>
                    <button class="button btn_huge btn_default" type="button" onclick="addDialogClose()">取消</button>
                </div>
            </div>
        </div>
        <div class="editDialog dialog-box">
            <div class="dialog-box__title">修改</div>
            <div class="dialog-box__content">
                <table>
                    <tr class="input-item"><td><span class="label-item">I D:</span></td><td><input type="text" disabled="disabled" class="input-text edit-id"/></td></tr>
                    <tr class="input-item"><td><span class="label-item">名称:</span></td><td><input type="text" class="input-text edit-name"/></td></tr>
                    <tr class="input-item"><td><span class="label-item">密码:</span></td><td><input type="text" class="input-text edit-pwd"/></td></tr>
                </table>
                <div class="btnBox">
                    <button class="button btn_huge btn_append" type="button" onclick="editAdmin()">修改</button>
                    <button class="button btn_huge btn_default" type="button" onclick="editDialogClose()">取消</button>
                </div>
            </div>
        </div>
    </form>
    <script src="/Content/Js/jquery-3.3.1.min.js"></script>
    <script src="/Content/Js/ui.js"></script>
    <script src="/Content/Js/components.js"></script>
    <script>
        var pageIndex = 1;
        var pageSize = 9;
        var pageCount = 0;
        var editDialog = new Dialog(".editDialog");
        function showEditDialog(id) {
            $.post("/Ashx/Admin/AdminAction.ashx", { "action": "getById", "id": id }, function (data) {
                var index = data.indexOf(":");
                var serverData = data.split(":");
                if (serverData[0] == "ok") {
                    var json = data.substring(index + 1, data.length);
                    var obj = $.parseJSON(json);
                    $(".edit-id").val(obj.Id);
                    $(".edit-name").val(obj.AdminName);
                    editDialog.show();
                }
            });
        }
        function editDialogClose() {
            editDialog.hide();
        }
        function editAdmin() {
            var id = $(".edit-id").val();
            var name = $(".edit-name").val();
            var pwd = $(".edit-pwd").val();
            $.post("/Ashx/Admin/AdminAction.ashx", {"action": "edit","id":id,"adminName":name,"pwd":pwd}, function (data) {
                var serverData = data.split(":");
                var msg = new Message();
                if (serverData[0] == "ok") {
                    $(".edit-id").val("");
                    $(".edit-name").val("");
                    $(".edit-pwd").val("");
                    getAdmins();
                    editDialog.hide();
                    msg.success(serverData[1]);
                } else {
                    msg.danger(serverData[1]);
                }
            });
        }
        var addDialog = new Dialog(".addDialog");
        function showAddDialog() {
            addDialog.show();
        }
        function addAdmin() {
            var name = $(".input-name").val();
            var pwd = $(".input-pwd").val();
            $.post("/Ashx/Admin/AdminAction.ashx", { "action": "add", "adminName": name, "pwd": pwd }, function (data) {
                var serverData = data.split(":");
                var msg = new Message();
                if (serverData[0] == "ok") {
                    getAdmins();
                    msg.success(serverData[1]);
                    addDialog.hide();
                    $(".input-name").val("");
                    $(".input-pwd").val("");
                } else {
                    msg.danger(serverData[1]);
                }
            });
        }
        function addDialogClose() {
            addDialog.hide();
        }
        function deleteAdmin(obj, id) {
            $.ajax({
                type: "post",
                url: "/Ashx/Admin/AdminAction.ashx",
                data: { "action": "delete", "id": id },
                success: function (data) {
                    var serverData = data.split(":");
                    var message = new Message();
                    if (serverData[0] == "ok") {
                        $(obj).parent().parent().remove();
                        message.success(serverData[1]);
                        getAdmins();
                    }
                    else if (serverData[0] == "no") {
                        message.warning(serverData[1]);
                    }
                    else {
                        message.danger(serverData[1]);
                    }
                }
            });
        }
        function getAdmins() {
            $.ajax({
                type: "get",
                url: "/Ashx/Admin/AdminAction.ashx",
                data: { "action": "get", "pageIndex": pageIndex, "pageSize": pageSize },
                success: function (data) {
                    var serverData = data.split(":");
                    var msg = new Message();
                    if (serverData[0] == "error") {
                        msg.danger(serverData[1]);
                    }
                    $(".table-header").siblings().remove();
                    $(".page-box").children().remove();
                    data = $.parseJSON(data);
                    pageIndex = data.pageIndex;
                    pageSize = data.pageSize;
                    pageCount = data.pageCount;
                    var list = data.data;
                    if (list == null) return;
                    var header_tr = $(".table-header").children();
                    var del_method = $(".table-header td:last").attr("onDelete");
                    var edit_method = $(".table-header td:last").attr("onEdit");
                    for (var i = 0; i < list.length; ++i) {
                        var tr = $(`<tr></tr>`);
                        for (var j = 0; j < header_tr.length - 1; ++j) {
                            var temp_tr = $(header_tr[j]);
                            $(`<td>${list[i][temp_tr.attr("bind")]}</td>`).appendTo(tr);
                        }
                        var last_tr = $(header_tr[header_tr.length - 1]);
                        $(`<td>
                               <button type="button" class="button btn_big btn_append" onclick="${edit_method}(${list[i][last_tr.attr("bind")]})"><span class="iconfont icon-xitong"></span></button>
                               <button type="button" onclick="${del_method}(this, ${list[i][last_tr.attr("bind")]})" class="button btn_big btn_danger"><span class="iconfont icon-shanchu"></span></button>
                           </td>`).appendTo(tr);
                        $(".card__table-box table").append(tr);
                    }
                    var pagination = new Pagination($(".page-box"));
                    pagination.reload(pageIndex, pageCount, 2);
                    $(".first_page").click(function () {
                        pageIndex = 1;
                        getAdmins();
                    });
                    $(".last_page").click(function () {
                        pageIndex = pageCount;
                        getAdmins();
                    });
                    $(".previou_page").click(function () {
                        pageIndex = --pageIndex < 1 ? 1 : pageIndex;
                        getAdmins();
                    });
                    $(".next_page").click(function () {
                        pageIndex = ++pageIndex > pageCount ? pageCount : pageIndex;
                        getAdmins();
                    });
                    $(".page_num").click(function () {
                        pageIndex = parseInt($(this).text());
                        getAdmins();
                    });
                }
            });
        }
        $(function () {
            getAdmins();
        });
    </script>
</body>
</html>
