var wp = {}

var lupa = {
    onLoad: function () {
        var toggleNav = function() {
            var btn = $(this);
            var node = $(btn.data("target"));
            var btn_warp = btn.closest(".navbar-toggle-img-btn-container");
            var w = btn_warp.outerWidth();
            var h = btn_warp.height();
            var nav_w = 0;
            node.find("[data-link-text]").each(function() {
                var len = $(this).text().length
                if (len > nav_w) {
                    nav_w = len;
                }
            });
            node.css({
                position: "absolute",
                top: btn_warp.offset().top + h + "px",
                right: "0px",
                zIndex: 9999,
                minWidth: w,
                width: nav_w / 1.5 + "em"
            });
            node.toggleClass("hidden");
        };
        flyout_toggle = $("[data-toggle='flyout']");
        flyout_toggle.on("click", toggleNav);
        flyout_toggle.on("blur", function () {
            var btn = $(this);
            var node = $(btn.data("target"));
            setTimeout(function () {
                node.addClass("hidden");
            }, 100);
        });
    }
};


$(document).ready(function() {
    lupa.onLoad();
});