lupa.managementLogin = {
    init : function(baseUrl) {
        this.initLoginForm(baseUrl);
    },
    initLoginForm : function(baseUrl) {
        var self = this;
        
        $("[data-login-form]").off("submit").on("submit", function(e) { e.preventDefault(); });
        
        $("[data-login-button]").off("click").on("click", function(e) {
            e.preventDefault();
            
            var $btn = $(this)
            var $form = $btn.closest("form");
            var $spinner = $form.find("[data-login-spinner]");
            $form.find("[data-is-ajax-input]").val(1);
            var data = $form.serialize();
            data += "&__csrf_token=" + lupa.antiCSRFToken();
            
            $.ajax({
                type: "post",
                url : baseUrl + "/management_login_submit",
                data : data,
                beforeSend : function() {
                    $btn.prop("disabled", true);
                    $spinner.show();
                },
                success : function(html) {
                    self.onLoginSuccess($form, html)
                },
                error : function() {
                    self.onLoginError($btn);
                },
                complete : function() {
                    $spinner.hide();
                }
            });
        });
    },
    onLoginSuccess : function($form, html) {
        var self = this;
        $form.slideUp(200, function() {
            $output = $("[data-form-content] [data-login-feedback]");
            $output.css("opacity", 0).html(html).animate({opacity : 1});
            $output = $("[data-form-content] [data-login-feedback]"); // re-evaluate the node
            $link = $output.find("a[data-login-success]").first();
            if ($link.length > 0) {
                var s = 4;
                var txt = $link.text();
                $link.text(txt + " (" + s + " s)");
                var updateAutoNav = function() {
                    if (s > 0) {
                        s -= 1;
                        $link.text(txt + " (" + s + " s)");
                        setTimeout(updateAutoNav, s*1000);
                    }
                    else {
                        window.location = $link.attr("href");
                    }
                };
                updateAutoNav();
            } else {
                self.initLoginForm();
            }
        });
    },
    onLoginError : function($btn) {
        window.alert("Sorry, but an error has occurred. Please try again, and refresh the page first.");
        $btn.prop("disabled", false);
    }
};
