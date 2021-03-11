<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CollectFirewood.Manager.Index" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/Content/Css/Index.css">
    <link rel="stylesheet" href="/Content/Css/ui.css">
    <link rel="stylesheet" href="/Content/Css/common.css">
</head>
<body>
    <div class="container-box">
        <%-- 内容 --%>
        <div class="header">
            <h3 class="header__title">拾柴网</h3>
                <input type="button" value="退出" class="exit_btn button btn_default btn_huge">
        </div>
        <%-- 内容 --%>
        <div class="container grid">
            <div class="container__side">
                <div class="menu">
                </div>
            </div>
            <div class="container__content grid-1">
                <iframe class="components" src="https://localhost:44324/Manager/Components/Admins.aspx">
                </iframe>
            </div>
        </div>
    </div>
    <script src="/Content/Js/jquery-3.3.1.min.js"></script>
    <script>
        var menus = [
            { menu: '用户管理', subMenus: [{ menu: '管理员列表', url: 'https://localhost:44324/Manager/Components/Admins.aspx' }, { menu: '用户列表', url:'https://localhost:44324/Manager/Components/Users.aspx'}] },
            { menu: '分类管理', subMenus: [{ menu: '分类列表', url: 'https://localhost:44324/Manager/Components/Classifys.aspx' }] },
            { menu: '项目管理', subMenus: [{ menu: '项目列表', url: 'https://localhost:44324/Manager/Components/Projects.aspx' }, { menu: '支持项目列表', url: 'https://localhost:44324/Manager/Components/SupportProjects.aspx' }] },
            { menu: '评论管理', subMenus: [{ menu: '评论列表', url: 'https://localhost:44324/Manager/Components/Comments.aspx' }]},
        ];
        function initMenu() {
            for (var i = 0; i < menus.length; ++i) {
                $(".menu").append($(`<h3 class="menu__title">${menus[i].menu}</h3>`));
                var ul = $('<ul class="menu__sub"></ul>');
                $(".menu").append(ul);
                for (var j = 0; j < menus[i].subMenus.length; ++j) {
                    $(`<li class="menu__item" url="${menus[i].subMenus[j].url}">${menus[i].subMenus[j].menu}</li>`).appendTo(ul);
                }
                $(".menu__item").click(function () {
                    var url = $(this).attr("url");
                    $(".components").attr("src",url);
                });
            }
        }
        initMenu();
        $(function () {
            var menu_index = window.sessionStorage.getItem("select_menu");
            menu_index = menu_index == null ? 0 : menu_index;
            var subMenu_index = window.sessionStorage.getItem("select_subMenu");
            subMenu_index = subMenu_index == null ? 0 : subMenu_index;
            var url = $(".menu__title").eq(menu_index).addClass("menu__title--acitve")
                .next(".menu__sub").slideDown().find(".menu__item").eq(subMenu_index).addClass("menu__item--acitve").attr("url");
            $(".components").attr("src", url);
            $(".menu__title").click(function () {
                $(".menu__title--acitve").each(function () {
                    $(this).removeClass("menu__title--acitve");
                });
                $(this)
                    .toggleClass("menu__title--acitve")
                    .next("ul").slideToggle().siblings("ul")
                    .slideUp();
                var index = $(this).index();
                window.sessionStorage.setItem("select_menu", index/2);
            });
            $(".menu__item").click(function () {
                $(".menu__item--acitve").each(function () {
                    $(this).removeClass("menu__item--acitve");
                });
                $(this).toggleClass("menu__item--acitve");
                var index = $(this).index();
                window.sessionStorage.setItem("select_subMenu", index);
            });
        });
    </script>
</body>
</html>