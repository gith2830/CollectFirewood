<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="CollectFirewood.Manager.Components.Comments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="/Content/Css/common.css"/>
    <link rel="stylesheet" href="/Content/Css/ui.css"/>
    <link rel="stylesheet" href="/Content/Css/iconfont.css"/>
    <link rel="stylesheet" href="/Content/Css/Components.css"/>
    <style>
        .label-item{
            width: 100px;
        }
    </style>
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
                            <td bind="UserId">所属用户ID</td>
                            <td bind="ProjectId">所属项目ID</td>
                            <td bind="Content">内容</td>
                            <td bind="Id" onDelete="deleteComment" onEdit="showEditDialog">操作</td>
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
                    <tr class="input-item"><td><span class="label-item">所属用户Id:</span></td><td><input type="number" class="input-text add-userId"/></td></tr>
                    <tr class="input-item"><td><span class="label-item">所属项目Id:</span></td><td><input type="number" class="input-text add-projectId"/></td></tr>
                    <tr class="input-item"><td><span class="label-item">内容:</span></td><td><input type="text" class="input-text add-content"/></td></tr>
                </table>
                <div class="btnBox">
                    <button class="button btn_huge btn_append" type="button" onclick="addComment()">添加</button>
                    <button class="button btn_huge btn_default" type="button" onclick="addDialogClose()">取消</button>
                </div>
            </div>
        </div>
        <div class="editDialog dialog-box">
            <div class="dialog-box__title">修改</div>
            <div class="dialog-box__content">
                <table>
                    <tr class="input-item"><td><span class="label-item">Id:</span></td><td><input type="number" disabled class="input-text edit-id"/></td></tr>
                    <tr class="input-item"><td><span class="label-item">所属用户Id:</span></td><td><input type="number" class="input-text edit-userId"/></td></tr>
                    <tr class="input-item"><td><span class="label-item">所属项目Id:</span></td><td><input type="number" class="input-text edit-projectId"/></td></tr>
                    <tr class="input-item"><td><span class="label-item">内容:</span></td><td><input type="text" class="input-text edit-content"/></td></tr>
                </table>
                <div class="btnBox">
                    <button class="button btn_huge btn_append" type="button" onclick="editComment()">修改</button>
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
            $.post("/Ashx/Comment/CommentAction.ashx", { "action": "getById", "id": id }, function (data) {
                var index = data.indexOf(":");
                var serverData = data.split(":");
                if (serverData[0] == "ok") {
                    var json = data.substring(index + 1, data.length);
                    var obj = $.parseJSON(json);
                    $(".edit-id").val(obj.Id);
                    $(".edit-userId").val(obj.UserId);
                    $(".edit-projectId").val(obj.ProjectId);
                    $(".edit-content").val(obj.Content);
                    editDialog.show();
                }
            });
        }
        function editDialogClose() {
            editDialog.hide();
        }
        function editComment() {
            var id = $(".edit-id").val();
            var userId = $(".edit-userId").val();
            var projectId = $(".edit-projectId").val();
            var content = $(".edit-content").val();
            $.post("/Ashx/Comment/CommentAction.ashx", {
                "action": "edit",
                "id": id,
                "userId": userId,
                "projectId": projectId,
                "content": content,
            }, function (data) {
                var serverData = data.split(":");
                var msg = new Message();
                if (serverData[0] == "ok") {
                    $(".edit-id").val("");
                    $(".edit-userId").val("");
                    $(".edit-projectId").val("");
                    $(".edit-content").val("");
                    getComments();
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
        function addComment() {
            var userId = $(".add-userId").val();
            var projectId = $(".add-projectId").val();
            var content = $(".add-content").val();
            $.post("/Ashx/Comment/CommentAction.ashx", {
                "action": "add",
                "userId": userId,
                "projectId": projectId,
                "content": content,
            }, function (data) {
                var serverData = data.split(":");
                var msg = new Message();
                if (serverData[0] == "ok") {
                    getComments();
                    msg.success(serverData[1]);
                    addDialog.hide();
                    $(".add-userId").val("");
                    $(".add-projectId").val("");
                    $(".add-content").val("");
                } else {
                    msg.danger(serverData[1]);
                }
            });
        }
        function addDialogClose() {
            addDialog.hide();
        }
        function deleteComment(obj, id) {
            $.ajax({
                type: "post",
                url: "/Ashx/Comment/CommentAction.ashx",
                data: { "action": "delete", "id": id },
                success: function (data) {
                    var serverData = data.split(":");
                    var message = new Message();
                    if (serverData[0] == "ok") {
                        $(obj).parent().parent().remove();
                        message.success(serverData[1]);
                        getComments();
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
        function formatDate(num) {
            if (num < 10) {
                num = '0' + num;
            }
            return num;
        }
        function getComments() {
            $.ajax({
                type: "get",
                url: "/Ashx/Comment/CommentAction.ashx",
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
                        getComments();
                    });
                    $(".last_page").click(function () {
                        pageIndex = pageCount;
                        getComments();
                    });
                    $(".previou_page").click(function () {
                        pageIndex = --pageIndex < 1 ? 1 : pageIndex;
                        getComments();
                    });
                    $(".next_page").click(function () {
                        pageIndex = ++pageIndex >= pageCount ? pageCount : pageIndex;
                        getComments();
                    });
                    $(".page_num").click(function () {
                        pageIndex = parseInt($(this).text());
                        getComments();
                    });
                }
            });
        }
        $(function () {
            getComments();
        });
    </script>
</body>
</html>
