var wp = {}

var lupa = {
    onLoad: function () {
        var toggleNav = function() {
            var btn = $(this);
            var node = $(btn.data("target"));
            var btn_warp = btn.closest(".navbar-toggle-img-btn-container");
            var w = btn_warp.outerWidth();
            var h = btn_warp.height();
            var banner_h = $(".fp-banner-image").height();
            if (banner_h)  {
                banner_h += "px";
            } else {
                banner_h = "auto"
            }
            var nav_w = 0;
            var lc = $("#layout-container");
            node.find("[data-link-text]").each(function() {
                var len = $(this).text().length
                if (len > nav_w) {
                    nav_w = len;
                }
            });
            var btn_warp_os = btn_warp.offset();
            var window_width = $(window).width();
            var css = {
                position: "absolute",
                top: btn_warp_os.top + h + "px",
                zIndex: 9999,
                minWidth: w,
                width: nav_w / 1.5 + "em",
                height: banner_h
            };
            if (lc.outerWidth() < window_width) {
                css.left = btn_warp_os.left + "px";
                css.right = "initial";
            } else {
                css.right = "0px";
                css.left = "initial";
            }
            node.css(css);
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