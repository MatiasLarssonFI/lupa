(function($) {
    $(window).load(function() {
        var video = $('[data-video-player]');
        video.mediaelementplayer({
            success: function(mediaElement, originalNode, instance) {
                $("[data-video-select]").on("click", function() {
                    instance.setSrc($(this).data("videoSelect"));
                    instance.play();
                });
            },
            pluginPath: video.data("cfgPluginPath"),
            stretching: "responsive",
            poster: video.data("cfgPoster"),
        });
    });
})(jQuery);
