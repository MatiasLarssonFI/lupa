!function($) {
    wp.contact = {
        init : function() {
            var self = this;
            $("[data-contact-form]").off("submit").submit(function(e) {
                e.preventDefault();
                
                var form = $(this);
                var submit_btn = form.find("button[type='submit']");
                var spinner = form.find("[data-ajax-spinner]");
                
                form.find("[data-is-ajax-input]").val(1);
                $.ajax({
                    type: "post",
                    url : form.attr("action"),
                    data : form.serialize(),
                    beforeSend : function() {
                        submit_btn.prop("disabled", true);
                        spinner.animate({opacity : 1});
                    },
                    success : function(html) {
                        form.slideUp(600, function() {
                            $("[data-form-content] [data-contact-feedback]").css("opacity", 0).html(html).animate({opacity : 1});
                            self.init();
                        });
                    },
                    error : function() {
                        alert("We're sorry, but an error has occured. Please try again later.");
                        submit_btn.prop("disabled", false);
                    },
                    complete : function() {
                        spinner.animate({opacity : 0});
                    }
                });
            });
        }
    };
}(jQuery);
