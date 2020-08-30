lupa.workList = {
    init : function(baseUrl) {
        this.initStateForm(baseUrl);
        this.initNotesForm(baseUrl);
    },
    initStateForm : function(baseUrl) {
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
                        self.onItemSubmitError($btn, baseUrl);
                    }
                },
                error : function() {
                    self.onItemSubmitError($btn, baseUrl);
                },
                complete : function() {
                    $spinner.hide();
                }
            });
        });
    },
    initNotesForm : function(baseUrl) {
        var self = this;
        
        $("[data-item-notes]").on("input", function() {
            $(this).closest("[data-list-item]").find("[data-notes-status]").text(" edited");
        });
        
        $("[data-item-notes]").on("blur", function() {
            var $input = $(this);
            var $item = $input.closest("[data-list-item]");
            
            $.ajax({
                type: "post",
                url : baseUrl + "/work_item_submit",
                dataType: "json",
                data : {
                    item : $input.data("item"),
                    action: "notes",
                    notes: $input.val(),
                    is_ajax: true,
                    __csrf_token: lupa.antiCSRFToken()
                },
                success : function(response) {
                    if (response.is_success) {
                        self.onItemNotesSuccess($item);
                    } else {
                        self.onItemNotesError($item, baseUrl);
                    }
                },
                error : function() {
                    self.onItemNotesError($item, baseUrl);
                },
            });
        });
    },
    onItemSubmitSuccess : function($btn, $item, response) {
        var notes = $item.find("[data-item-notes]").val();
        $btn.text("DONE");
        $item.delay(250).fadeOut(250, function() {
            $item.remove();
        });
        this.updateItemCounts(response.item_counts);
        if (!response.notes_success) {
            window.alert("Progress was saved successfully but notes failed. Notes (copy them now because they will be lost): " + notes);
        }
    },
    onItemSubmitError : function($btn, baseUrl) {
        lupa.refreshAntiCSRFToken(baseUrl);
        window.alert("Sorry, but an error has occurred. Please try again and if the problem persists, refresh the page.");
        $btn.prop("disabled", false);
    },
    onItemNotesSuccess : function($item) {
        var $node = $item.find("[data-notes-status]");
        $node.text(" saved.");
    },
    onItemNotesError : function($item, baseUrl) {
        lupa.refreshAntiCSRFToken(baseUrl);
        var notes = $item.find("[data-item-notes]").val();
        window.alert("Failed to save notes. Please try again and if the problem persists, refresh the page. Notes (copy them now because they will be lost): " + notes);
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
