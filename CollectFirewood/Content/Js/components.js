function Pagination(pageBox) {
    var pagination = new Object();
    //pageIndex 当前页 pageCount 总页数 sideCount 显示边缘页数
    var pageBox = pageBox;
    pagination.reload = function (pageIndex, pageCount, sideCount) {
        pageBox.append($('<li class="page-box__page-item first_page" ><<</li>'));
        if (pageIndex > 1) {
            pageBox.append($('<li class="page-box__page-item previou_page" ><</li>'));
        }
        for (var i = pageIndex - sideCount < 1 ? 1 : pageIndex - sideCount; i < pageIndex; ++i) {
            pageBox.append(`<li class="page-box__page-item page_num" >${i}</li>`);
        }
        pageBox.append($(`<li class="page-box__page-item page-box__page-item--active" >${pageIndex}</li>`));
        for (var i = pageIndex + 1 > pageCount ? pageCount : pageIndex + 1; i <= (pageIndex + sideCount > pageCount ? pageCount : pageIndex + sideCount) && pageIndex != pageCount; ++i) {
            pageBox.append(`<li class="page-box__page-item page_num" >${i}</li>`);
        }
        if (pageIndex < pageCount) {
            pageBox.append($('<li class="page-box__page-item next_page" >></li>'));
        }
        pageBox.append($('<li class="page-box__page-item last_page" >>></li>'));
    }
    return pagination;
}