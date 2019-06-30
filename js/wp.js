var wp = {};

var lupa = {
    onLoad: function () {
        var toggleNav = function() {
            var btn = $(this);
            var node = $(btn.data("target"));
            var btn_warp = btn.closest(".navbar-toggle-img-btn-container");
            var w = btn_warp.outerWidth();
            var h = btn_warp.height();
            var longest_text = 0;
            var lc = $("#layout-container");
            
            var btn_warp_os = btn_warp.offset();
            var window_width = $(window).width();
            
            // get longest nav link text and use as width for all
            node.find("[data-link-text]").each(function() {
                var len = $(this).text().length;
                if (len > longest_text) {
                    longest_text = len;
                }
            });
            node.find(".lupa-nav-link").each(function() {
                $(this).css("width", (longest_text / 1.37) + "em");
            });
            
            // render node (but don't show to user yet) to get width
            node.css({
                width: (longest_text * 1.5) + "em",
                visibility: "hidden"
            });
            node.toggleClass("hidden");
            
            var css = {
                position: "absolute",
                top: btn_warp_os.top + h + "px",
                zIndex: 9999,
                minWidth: w + 1,
                height: "auto",
                left: lc.offset().left + lc.outerWidth() - node.outerWidth(),
                right: "initial",
                visibility: "visible" // show to user
            };
            
            node.css(css);
        };
        var flyout_toggle = $("[data-toggle='flyout']");
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