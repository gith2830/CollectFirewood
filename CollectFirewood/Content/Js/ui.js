//消息框 1.warning 2.success
function Message() {
    var msg = new Object();
    // 
    msg.danger = function (content) {
        var msgBox = $(`<div class="message msg_danger">
                   <span class="message__icon">!</span>
                   <span class="message__content">${content}</span>
               </div>`)
        .appendTo("body")
        .animate({ "top": "80px" }, 500);
        setTimeout(() => {
            msgBox.animate({ "top": "-50px" }, 500, function () {
                msgBox.remove();
            });
        }, 2000);
    };
    msg.warning = function (content) {
        var msgBox = $(`<div class="message msg_warning">
                   <span class="message__icon">!</span>
                   <span class="message__content">${content}</span>
               </div>`)
        .appendTo("body")
        .animate({ "top": "80px" }, 500);
        setTimeout(() => {
            msgBox.animate({ "top": "-50px" }, 500, function () {
                msgBox.remove();
            });
        }, 2000);
    };
    msg.success = function (content) {
        var msgBox = $(`<div class="message msg_success">
                   <span class="message__icon">!</span>
                   <span class="message__content">${content}</span>
               </div>`)
        .appendTo("body")
        .animate({ "top": "80px" }, 500);
        setTimeout(() => {
            msgBox.animate({ "top": "-50px" }, 500, function () {
                msgBox.remove();
            });
        }, 2000);
    };
    return msg;
};
//对话框
function Dialog(obj) {
    var dialog = new Object();
    dialog.show = function () {
        $(obj).before($('<div class="dialog-baffle"></div>'));
        $(obj).slideDown(200);
    }
    dialog.hide = function () {
        $(obj).slideUp(200, function () {
            $(obj).prev(".dialog-baffle").remove();
        });
    }
    var closeBtn = $('<span class="dialog-close_btn">×</span>');
    var temp = $(obj).find(".dialog-box__title")
    if (!$(obj).find(".dialog-box__title>.dialog-close_btn").get(0)) {
        temp.append(closeBtn);
    }
    closeBtn.click(function () {
        dialog.hide();
    });
    return dialog;
}