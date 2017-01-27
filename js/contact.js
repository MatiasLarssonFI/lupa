!function($) {
    wp.contact = {
        init : function() {
            $("#contact-form").unbind("submit").submit(function(e) {
                e.preventDefault();
                
                var form = $(this);
                var submit_btn = form.find("button[type='submit']");
                var spinner = form.find("#ajax-spinner");
                
                form.find("#is_ajax").val(1);
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
                            $("#form-content #feedback").css("opacity", 0).html(html).animate({opacity : 1});
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
