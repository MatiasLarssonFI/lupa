(function($) {
    $(window).load(function() {
        $('[data-video-player]').mediaelementplayer({
            success: function(mediaElement, originalNode, instance) {
                $("[data-video-select]").on("click", function() {
                    instance.setSrc($(this).data("videoSelect"));
                    instance.load();
                    instance.play();
                });
            },
            pluginPath: "/lib/mediaelement-4.2.7/build",
            stretching: "fill"
        });
    });
})(jQuery);
