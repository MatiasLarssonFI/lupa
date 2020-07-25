lupa.workList = {
    // TBD: notes separate save
    init : function(baseUrl) {
        var self = this;
        
        $("[data-item-action]").on("click", function() {
            var $btn = $(this)
            var action = $btn.data("item-action").toLowerCase();
            var spinnerClass = $.inArray(action, [ "archive", "halt", "notes" ]) !== -1 ? action : "action";
            var $item = $btn.closest("[data-list-item]");
            var $spinner = $item.find("[data-item-" + spinnerClass + "-spinner]");
            
            $.ajax({
                type: "post",
                url : baseUrl + "/work_item_submit",
                dataType: "json",
                data : {
                    item : $btn.data("item"),
                    action: action,
                    notes: $item.find("[data-item-notes]").val(),
                    is_ajax: true,
                    __csrf_token: lupa.antiCSRFToken()
                },
                beforeSend : function() {
                    $btn.prop("disabled", true);
                    $spinner.show();
                },
                success : function(response) {
                    if (response.is_success) {
                        self.onItemSubmitSuccess($btn, $item, response);
                    } else {
                        self.onItemSubmitError($btn);
                    }
                },
                error : function() {
                    self.onItemSubmitError($btn);
                },
                complete : function() {
                    $spinner.hide();
                }
            });
        });
    },
    onItemSubmitSuccess : function($btn, $item, response) {
        $btn.text("DONE");
        $item.delay(250).fadeOut(250, function() {
            $item.remove();
        });
        this.updateItemCounts(response.item_counts);
    },
    onItemSubmitError : function($btn) {
        window.alert("Sorry, but an error has occured. Please try again, and refresh the page first.");
        $btn.prop("disabled", false);
    },
    updateItemCounts : function(counts) {
        for (state in counts) {
            var $node = $("[data-item-count-" + state.replace("STATE_", "").toLowerCase() + "]");
            var original = $node.text();
            $node.text(counts[state]);
            if (original !== $node.text()) {
                // highlight changed count
                $node.addClass("orange work-list-highlight");
            }
        }
        // clear highlights with a delay
        setTimeout(function() { $(".work-list-highlight").removeClass("orange work-list-highlight"); }, 1000);
    }
};
