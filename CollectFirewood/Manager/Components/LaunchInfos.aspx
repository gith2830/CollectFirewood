<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LaunchInfos.aspx.cs" Inherits="CollectFirewood.Manager.Components.LaunchInfos" %>

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
                <div class="card__table-box">
                    <table cellspacing="0" cellpadding="0">
                        <tr class="table-header">
                            <td bind="UserId">ID</td>
                            <td bind="TrueName">真名</td>
                            <td bind="BankCard">银行卡号</td>
                            <td bind="ProjectId">项目Id</td>
                            <td bind="UserId" onDelete="deleteLaunchInfo">操作</td>
                        </tr>
                    </table>
                </div>
                <ul class="page-box">
                </ul>
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
        var count = 0;
        function deleteLaunchInfo(obj, id) {
            $.ajax({
                type: "post",
                url: "/Ashx/Project/LaunchInfoAction.ashx",
                data: { "action": "delete", "id": id },
                success: function (data) {
                    var serverData = data.split(":");
                    var message = new Message();
                    if (serverData[0] == "ok") {
                        if (count <= 1) {
                            --pageIndex;
                        }
                        $(obj).parent().parent().remove();
                        message.success(serverData[1]);
                        getClassifys();
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
        function getLaunchInfos() {
            $.ajax({
                type: "get",
                url: "/Ashx/Project/LaunchInfoAction.ashx",
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
                    count = list.length;
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
                               <button type="button" onclick="${del_method}(this, ${list[i][last_tr.attr("bind")]})" class="button btn_big btn_danger"><span class="iconfont icon-shanchu"></span></button>
                           </td>`).appendTo(tr);
                        $(".card__table-box table").append(tr);
                    }
                    var pagination = new Pagination($(".page-box"));
                    pagination.reload(pageIndex, pageCount, 2);
                    $(".first_page").click(function () {
                        pageIndex = 1;
                        getClassifys();
                    });
                    $(".last_page").click(function () {
                        pageIndex = pageCount;
                        getClassifys();
                    });
                    $(".previou_page").click(function () {
                        pageIndex = --pageIndex < 1 ? 1 : pageIndex;
                        getClassifys();
                    });
                    $(".next_page").click(function () {
                        pageIndex = ++pageIndex > pageCount ? pageCount : pageIndex;
                        getClassifys();
                    });
                    $(".page_num").click(function () {
                        pageIndex = parseInt($(this).text());
                        getClassifys();
                    });
                }
            });
        }
        $(function () {
            getLaunchInfos();
        });
    </script>
</body>
</html>
