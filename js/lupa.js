var CookieConsent = function() {
    var self = this;
    this._onConsentFns = [];
    this._cookies = {
        hasConsent : "lupaConsent"
    };
    this.$promptElement = $("[data-cookie-consent-prompt]");
    this.$promptElement.find("[data-cookie-consent-btn]").on("click", function() {
        if (!self.hasConsent()) {
            self.onConsent();
        }
        self.saveConsent(true);
    });
    this.$promptElement.find("[data-cookie-consent-deny-btn]").on("click", function() {
        self.saveConsent(false);
        location.reload();
    });
    $promptOpenBtn = $("[data-cookie-consent-prompt-open]");
    if ($promptOpenBtn.length > 0) {
        $promptOpenBtn.on("click", function() { self.prompt(); });
    }
};

CookieConsent.prototype.addConsentCb = function(fn) {
    this._onConsentFns.push(fn);
};

CookieConsent.prototype.onConsent = function() {
    this._cookieConsentFns.forEach(function(fn) { fn(); });
}

CookieConsent.prototype.hasSelection = function() {
    return document.cookie.indexOf(this._cookies.hasConsent + "=") !== -1;
};

CookieConsent.prototype.hasConsent = function() {
    return document.cookie.indexOf(this._cookies.hasConsent + "=true") !== -1;
};

CookieConsent.prototype.saveConsent = function(haveConsent) {
     document.cookie = this._cookies.hasConsent += "=" + (haveConsent ? "true" : "false") + "; expires=Fri, 31 Dec 9999 23:59:59 GMT";
};

CookieConsent.prototype.prompt = function() {
    this.$promptElement.show();
};

CookieConsent.prototype.updateGui = function() {
    if (!this.hasSelection()) {
        this.prompt();
    }
};

lupaCookieConsent = new CookieConsent();

var lupa = {
    onLoad: function () {
        lupaCookieConsent.updateGui();
        
        var toggleNav = function() {
            var btn = $(this);
            var node = $(btn.data("target"));
            var btn_warp = btn.closest(".navbar-toggle-img-btn-container");
            var w = parseInt(btn_warp.outerWidth());
            var h = parseInt(btn_warp.height());
            var longest_text = 0;
            var lc = $("#layout-container");
            
            var btn_warp_os = btn_warp.offset();
            var window_width = parseInt($(window).width());
            
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
                position: "absolute",
                top: btn_warp_os.top + h + "px",
                zIndex: 9999,
                minWidth: w + 1,
                height: "auto",
                right: "initial",
                width: (longest_text * 1.5) + "em",
                opacity: 0
            });
            node.toggleClass("hidden");
            node.css({
                left: lc.offset().left + parseInt(lc.outerWidth()) - parseInt(node.outerWidth()),
                opacity: 1 // show to user
            });
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
    },
    
    _antiCSRFToken: undefined,
    
    refreshAntiCSRFToken: function(baseUrl) {
        var self = this;
        $.ajax({
            type: "get",
            url : baseUrl + "/anti_csrf_token",
            dataType: "json",
            success : function(response) {
                self._antiCSRFToken = response.token;
            }
        });
    },
    
    antiCSRFToken: function() {
        return this._antiCSRFToken;
    }
};


$(document).ready(function() {
    lupa.onLoad();
});
