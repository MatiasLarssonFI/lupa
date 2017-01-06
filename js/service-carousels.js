!function($) {
    var carousels = $(".service-carousel");
    carousels.slick({
        autoplay: true,
        autoplaySpeed: 4000,
        adaptiveHeight: true,
        fade: true,
        infinite: true,
        arrows: false,
        pauseOnFocus: false,
        cssEase: 'linear'
    });
    carousels.click(function() {
        $(this).slick("slickNext");
    });
}(jQuery);
