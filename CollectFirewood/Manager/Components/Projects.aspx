<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="CollectFirewood.Manager.Projects" %>

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
                <button class="button btn_huge btn_append" type="button" onclick="showExamineDialog()">待审批</button>
                <div class="card__table-box">
                    <table class="main-table" cellspacing="0" cellpadding="0">
                        <tr class="table-header">
                            <td bind="Id">ID</td>
                            <td bind="ProjectName">项目名</td>
                            <td bind="State">状态</td>
                            <td bind="Goal">目标</td>
                            <td bind="Deadline">截至日期</td>
                            <td bind="LikeCount">喜欢人数</td>
                            <td bind="Id" onDelete="deleteProject" onEdit="showEditDialog">操作</td>
                        </tr>
                    </table>
                </div>
                <ul class="main-page page-box">
                </ul>
            </div>
        </div>
        <div class="addDialog dialog-box">
            <div class="dialog-box__title">添加</div>
            <div class="dialog-box__content">
                <table>
                    <tr class="input-item"><td><span class="label-item">所属分类:</span></td><td><select class="input-text classifyId"></select></td></tr>
                    <tr class="input-item"><td><span class="label-item">项目名:</span></td><td><input type="text" class="input-text projectName"/></td></tr>
                    <tr class="input-item"><td><span class="label-item">状态:</span></td><td><select class="input-text projectState"><option value="0">进行中</option><option value="1">完成</option></select></td></tr>
                    <tr class="input-item"><td><span class="label-item">目标金额:</span></td><td><input type="text" class="input-text projectGoal"/></td></tr>
                    <tr class="input-item"><td><span class="label-item">截至日期:</span></td><td><input type="date" class="input-text projectDeadline"/></td></tr>
                    <tr class="input-item"><td><span class="label-item">点赞数:</span></td><td><input type="text" class="input-text projectLikeCount"/></td></tr>
                    <tr class="input-item"><td><span class="label-item">内容:</span></td><td><input type="text" class="input-text projectContent"/></td></tr>
                </table>
                <div class="btnBox">
                    <button class="button btn_huge btn_append" type="button" onclick="addProject()">添加</button>
                    <button class="button btn_huge btn_default" type="button" onclick="addDialogClose()">取消</button>
                </div>
            </div>
        </div>
        <div class="examineDialog dialog-box">
            <div class="dialog-box__title">添加</div>
            <div class="dialog-box__content">
                <div class="card__table-box">
                    <table class="examine-table" cellspacing="0" cellpadding="0">
                        <tr class="table-header">
                            <td bind="Id">ID</td>
                            <td bind="ProjectName">项目名</td>
                            <td bind="Id" onDelete="unexamineProject" onEdit="examineProject">操作</td>
                        </tr>
                    </table>
                </div>
                <ul class="examine-page page-box">
                </ul>
            </div>
        </div>
        <div class="editDialog dialog-box">
            <div class="dialog-box__title">修改</div>
            <div class="dialog-box__content">
                <table>
                    <tr class="input-item"><td><span class="label-item">Id:</span></td><td><input type="text" disabled class="input-text edit-id"/></td></tr>
                    <tr class="input-item"><td><span class="label-item">所属分类:</span></td><td><select class="input-text edit-classifyId"></select></td></tr>
                    <tr class="input-item"><td><span class="label-item">项目名:</span></td><td><input type="text" class="input-text edit-projectName"/></td></tr>
                    <tr class="input-item"><td><span class="label-item">状态:</span></td><td><select class="input-text edit-projectState"><option value="0">进行中</option><option value="1">完成</option></select></td></tr>
                    <tr class="input-item"><td><span class="label-item">目标金额:</span></td><td><input type="number" class="input-text edit-projectGoal"/></td></tr>
                    <tr class="input-item"><td><span class="label-item">截至日期:</span></td><td><input type="date" class="input-text edit-projectDeadline"/></td></tr>
                    <tr class="input-item"><td><span class="label-item">点赞数:</span></td><td><input type="number" class="input-text edit-projectLikeCount"/></td></tr>
                    <tr class="input-item"><td><span class="label-item">内容:</span></td><td><input type="text" class="input-text edit-projectContent"/></td></tr>
                </table>
                <div class="btnBox">
                    <button class="button btn_huge btn_append" type="button" onclick="editProject()">修改</button>
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
            $.post("/Ashx/Project/ProjectAction.ashx", { "action": "getById", "id": id }, function (data) {
                var index = data.indexOf(":");
                var serverData = data.split(":");
                if (serverData[0] == "ok") {
                    var json = data.substring(index + 1, data.length);
                    var obj = $.parseJSON(json);
                    $(".edit-id").val(obj.Id);
                    //$(".edit-classifyId").val(obj.ClassifyId);
                    $(".edit-classifyId").find(`option[text='${obj.ClassifyId}']`).attr("selected", true);
                    $(".edit-projectName").val(obj.ProjectName);
                    $(".edit-projectState").find(`option[text='${obj.State}']`).attr("selected", true);
                    $(".edit-projectGoal").val(obj.Goal);
                    var strSec = obj.Deadline.match(/\d+/g);
                    var date = new Date(parseInt(strSec));
                    var temp = date.getFullYear() + '-' + formatDate(date.getMonth() + 1) + '-' + formatDate(date.getDate());
                    $(".edit-projectDeadline").val(temp);
                    $(".edit-projectLikeCount").val(obj.LikeCount);
                    $(".edit-projectContent").val(obj.Content);
                    $.post("/Ashx/Classify/ClassifyAction.ashx", { "action": "getAll" },
                        function (data) {
                            data = $.parseJSON(data);
                            for (var i = 0; i < data.length; ++i) {
                                $(".edit-classifyId").append($(`<option value="${data[i].Id}">${data[i].ClassifyName}</option>`));
                            }
                        });
                    editDialog.show();
                }
            });
        }
        //审批
        function examineProject(id) {
            $.post("/Ashx/Project/ProjectAction.ashx", { "action": "examine", "id": id }, function (data) {
                var serverData = data.split(":");
                var msg = new Message();
                if (serverData[0] == "ok") {
                    msg.success(serverData[1]);
                    getExamineProjects();
                } else {
                    msg.danger(serverData[1]);
                }
            });
        }
        //不审批
        function unexamineProject(obj,id) {
            $.post("/Ashx/Project/ProjectAction.ashx", { "action": "unexamine", "id": id }, function (data) {
                var serverData = data.split(":");
                var msg = new Message();
                if (serverData[0] == "ok") {
                    $(obj).parent().parent().remove();
                    msg.success(serverData[1]);
                    getExamineProjects();
                } else {
                    msg.danger(serverData[1]);
                }
            });
        }
        //编辑窗口退出
        function editDialogClose() {
            editDialog.hide();
        }
        function editProject() {
            var id = $(".edit-id").val();
            var classifyId = $(".edit-classifyId").val();
            var projectName = $(".edit-projectName").val();
            var projectState = $(".edit-projectState").val();
            var projectGoal = $(".edit-projectGoal").val();
            var projectDeadline = $(".edit-projectDeadline").val();
            var projectLikeCount = $(".edit-projectLikeCount").val();
            var projectContent = $(".edit-projectContent").val();
            $.post("/Ashx/Project/ProjectAction.ashx", {
                "action": "edit",
                "id": id,
                "classifyId": classifyId,
                "projectName": projectName,
                "state": projectState,
                "goal": projectGoal,
                "deadline": projectDeadline,
                "likeCount": projectLikeCount,
                "content": projectContent,
            }, function (data) {
                var serverData = data.split(":");
                var msg = new Message();
                if (serverData[0] == "ok") {
                    $(".edit-id").val("");
                    $(".edit-classifyName").val("");
                    getProjects();
                    editDialog.hide();
                    msg.success(serverData[1]);
                } else {
                    msg.danger(serverData[1]);
                }
            });
        }
        var addDialog = new Dialog(".addDialog");
        function showAddDialog() {
            $.post("/Ashx/Classify/ClassifyAction.ashx", { "action": "getAll" },
                function (data) {
                    data = $.parseJSON(data);
                    for (var i = 0; i < data.length; ++i) {
                        $(".classifyId").append($(`<option value="${data[i].Id}">${data[i].ClassifyName}</option>`));
                    }
                });
            addDialog.show();
        }
        var examineDialog = new Dialog(".examineDialog");
        function showExamineDialog() {
            getExamineProjects();
            examineDialog.show();
        }
        //发送添加项目请求
        function addProject() {
            var classifyId = $(".classifyId").val();
            var projectName = $(".projectName").val();
            var projectState = $(".projectState").val();
            var projectGoal = $(".projectGoal").val();
            var projectDeadline = $(".projectDeadline").val();
            var projectLikeCount = $(".projectLikeCount").val();
            var projectContent = $(".projectContent").val();
            $.post("/Ashx/Project/ProjectAction.ashx", {
                "action": "add",
                "classifyId": classifyId,
                "projectName": projectName,
                "state": projectState,
                "goal": projectGoal,
                "deadline": projectDeadline,
                "likeCount": projectLikeCount,
                "content": projectContent,
            }, function (data) {
                var serverData = data.split(":");
                var msg = new Message();
                if (serverData[0] == "ok") {
                    getProjects();
                    msg.success(serverData[1]);
                    addDialog.hide();
                    $(".classifyId").text("");
                    $(".projectName").val("");
                    $(".projectGoal").val("");
                    $(".projectDeadline").val("");
                    $(".projectLikeCount").val("");
                    $(".projectContent").val("");
                } else {
                    msg.danger(serverData[1]);
                }
            });
        }
        //添加窗口关闭
        function addDialogClose() {
            addDialog.hide();
        }
        //删除项目
        function deleteProject(obj, id) {
            $.ajax({
                type: "post",
                url: "/Ashx/Project/ProjectAction.ashx",
                data: { "action": "delete", "id": id },
                success: function (data) {
                    var serverData = data.split(":");
                    var message = new Message();
                    if (serverData[0] == "ok") {
                        $(obj).parent().parent().remove();
                        message.success(serverData[1]);
                        getProjects();
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
        // 获取项目集合
        function getProjects() {
            $.ajax({
                type: "get",
                url: "/Ashx/Project/ProjectAction.ashx",
                data: { "action": "get", "pageIndex": pageIndex, "pageSize": pageSize },
                success: function (data) {
                    var serverData = data.split(":");
                    var msg = new Message();
                    if (serverData[0] == "error") {
                        msg.danger(serverData[1]);
                    }
                    $(".main-table .table-header").siblings().remove();
                    $(".main-page").children().remove();
                    data = $.parseJSON(data);
                    pageIndex = data.pageIndex;
                    pageSize = data.pageSize;
                    pageCount = data.pageCount;
                    var list = data.data;
                    if (list == null) return;
                    for (var i = 0; i < list.length; ++i) {
                        var strSec = list[i].Deadline.match(/\d+/g);
                        var date = new Date(parseInt(strSec));
                        var year = date.getFullYear();
                        var month = date.getMonth()+1;
                        var day = formatDate(date.getDate());
                        var hours = formatDate(date.getHours());
                        var minutes = formatDate(date.getMinutes());
                        var seconds = formatDate(date.getSeconds());
                        list[i].Deadline = year + "-" + month + "-" + day + ":" + hours + ":" + minutes + ":" + seconds;
                    }
                    var header_tr = $(".main-table .table-header").children();
                    var del_method = $(".main-table .table-header td:last").attr("onDelete");
                    var edit_method = $(".main-table .table-header td:last").attr("onEdit");
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
                        $(".card__table-box .main-table").append(tr);
                    }
                    var pagination = new Pagination($(".main-table").parent().next(".page-box"));
                    pagination.reload(pageIndex, pageCount, 2);
                    $(".main-page .first_page").click(function () {
                        pageIndex = 1;
                        getProjects();
                    });
                    $(".main-page .last_page").click(function () {
                        pageIndex = pageCount;
                        getProjects();
                    });
                    $(".main-page .previou_page").click(function () {
                        pageIndex = --pageIndex < 1 ? 1 : pageIndex;
                        getProjects();
                    });
                    $(".main-page .next_page").click(function () {
                        pageIndex = ++pageIndex > pageCount ? pageCount : pageIndex;
                        getProjects();
                    });
                    $(".main-page .page_num").click(function () {
                        pageIndex = parseInt($(this).text());
                        getProjects();
                    });
                }
            });
        }
        function getExamineProjects() {
            $.ajax({
                type: "get",
                url: "/Ashx/Project/ProjectAction.ashx",
                data: { "action": "getExamine", "pageIndex": pageIndex, "pageSize": pageSize },
                success: function (data) {
                    var serverData = data.split(":");
                    var msg = new Message();
                    if (serverData[0] == "error") {
                        msg.danger(serverData[1]);
                    }
                    $(".examine-table .table-header").siblings().remove();
                    $(".examine-page").children().remove();
                    data = $.parseJSON(data);
                    pageIndex = data.pageIndex;
                    pageSize = data.pageSize;
                    pageCount = data.pageCount;
                    var list = data.data;
                    if (list == null) return;
                    for (var i = 0; i < list.length; ++i) {
                        var strSec = list[i].Deadline.match(/\d+/g);
                        var date = new Date(parseInt(strSec));
                        var year = date.getFullYear();
                        var month = date.getMonth() + 1;
                        var day = formatDate(date.getDate());
                        var hours = formatDate(date.getHours());
                        var minutes = formatDate(date.getMinutes());
                        var seconds = formatDate(date.getSeconds());
                        list[i].Deadline = year + "-" + month + "-" + day + ":" + hours + ":" + minutes + ":" + seconds;
                    }
                    var header_tr = $(".examine-table .table-header").children();
                    var del_method = $(".examine-table .table-header td:last").attr("onDelete");
                    var edit_method = $(".examine-table .table-header td:last").attr("onEdit");
                    for (var i = 0; i < list.length; ++i) {
                        var tr = $(`<tr></tr>`);
                        for (var j = 0; j < header_tr.length - 1; ++j) {
                            var temp_tr = $(header_tr[j]);
                            $(`<td>${list[i][temp_tr.attr("bind")]}</td>`).appendTo(tr);
                        }
                        var last_tr = $(header_tr[header_tr.length - 1]);
                        $(`<td>
                               <button type="button" class="button btn_big btn_append" onclick="${edit_method}(${list[i][last_tr.attr("bind")]})"><span class="iconfont icon-dagou"></span></button>
                               <button type="button" onclick="${del_method}(this, ${list[i][last_tr.attr("bind")]})" class="button btn_big btn_danger"><span class="iconfont icon-cuowu"></span></button>
                           </td>`).appendTo(tr);
                        $(".card__table-box .examine-table").append(tr);
                    }
                    var pagination = new Pagination($(".examine-table").parent().next(".page-box"));
                    pagination.reload(pageIndex, pageCount, 2);
                    $(".examine-page .first_page").click(function () {
                        pageIndex = 1;
                        getExamineProjects();
                    });
                    $(".examine-page .last_page").click(function () {
                        pageIndex = pageCount;
                        getExamineProjects();
                    });
                    $(".examine-page .previou_page").click(function () {
                        pageIndex = --pageIndex < 1 ? 1 : pageIndex;
                        getExamineProjects();
                    });
                    $(".examine-page .next_page").click(function () {
                        pageIndex = ++pageIndex > pageCount ? pageCount : pageIndex;
                        getExamineProjects();
                    });
                    $(".examine-page .page_num").click(function () {
                        pageIndex = parseInt($(this).text());
                        getExamineProjects();
                    });
                }
            });
        }
        $(function () {
            getProjects();
        });
    </script>
</body>
</html>
