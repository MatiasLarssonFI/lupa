!function($) {
    function getRandomArbitrary(min, max) {
        return Math.random() * (max - min) + min;
    }
    
    var carousels = $(".service-carousel");
    carousels.each(function() {
        $(this).slick({
            fade: true,
            infinite: true,
            arrows: false,
            pauseOnFocus: false,
            cssEase: 'linear'
        });
    });
    setInterval(function() {
        $(carousels[Math.floor(Math.random()*carousels.length)]).slick("slickNext");
    }, 4000);
    carousels.click(function() {
        $(this).slick("slickNext");
    });
}(jQuery);
