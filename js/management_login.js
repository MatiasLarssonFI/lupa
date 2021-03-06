lupa.managementLogin = {
    _baseUrl: undefined,
    init : function(baseUrl) {
        this._baseUrl = baseUrl;
        this.initLoginForm();
    },
    initLoginForm : function() {
        var self = this;
        
        $(".contact-url").attr("tabindex", "-1");
        
        $("[data-login-form]").off("submit").on("submit", function(e) {
            e.preventDefault();
            
            var $btn = $(this).find("[data-login-button]");
            var $form = $btn.closest("form");
            var $spinner = $form.find("[data-login-spinner]");
            $form.find("[data-is-ajax-input]").val(1);
            var data = $form.serialize();
            data += "&__csrf_token=" + lupa.antiCSRFToken();
            
            $.ajax({
                type: "post",
                url : self._baseUrl + "/management_login_submit",
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
        lupa.refreshAntiCSRFToken(self._baseUrl);
        $form.fadeOut(100, function() {
            $("[data-csrf-token]").remove(); // included in form (html)
            $output = $("[data-form-content] [data-login-feedback]");
            $output.css("opacity", 0).html(html).animate({opacity : 1});
            $output = $("[data-form-content] [data-login-feedback]"); // re-evaluate the node
            $link = $output.find("a[data-login-success]").first();
            if ($link.length > 0 && $output.find("[data-login-message]").length === 0) {
                var s = 4;
                var txt = $link.text();
                $link.text(txt + " (" + s + " s)");
                var iv = undefined;
                var updateAutoNav = function() {
                    if (s > 0) {
                        s -= 1;
                        $link.text(txt + " (" + s + " s)");
                    }
                    else {
                        clearInterval(iv);
                        window.location = $link.attr("href");
                    }
                };
                iv = setInterval(updateAutoNav, 1000);
            } else if ($link.length === 0) {
                self.initLoginForm();
            }
        });
    },
    onLoginError : function($btn) {
        window.alert("Sorry, but an error has occurred. Please try again, and refresh the page first.");
        $btn.prop("disabled", false);
    }
};
