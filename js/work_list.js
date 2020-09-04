lupa.workList = {
    init : function(baseUrl) {
        this.initMassStateForm(baseUrl);
        this.initStateForm(baseUrl);
        this.initNotesForm(baseUrl);
        this.initLogoutForm();
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
                        self.onItemSubmitSuccess(true, $btn, $item, response, baseUrl);
                    } else {
                        self.onItemSubmitError(true, $btn, baseUrl);
                    }
                },
                error : function() {
                    self.onItemSubmitError(true, $btn, baseUrl);
                },
                complete : function() {
                    $spinner.hide();
                }
            });
        });
    },
    initMassStateForm : function(baseUrl) {
        var self = this;
        var $submit = $("[data-mass-action-submit]");
        var $action_select = $("[data-mass-action-select]");
        
        var isPerformable = function($item, action) {
            return action === $item.data("itemStateAction") ||
                (action === "Halt" && $item.data("isHaltable") == 1) ||
                (action === "Archive" && $item.data("isArchivable") == 1)
        };
        var preprocessMassAction = function() {
            // - disable submit button if all selected items cannot perform the selected action
            // - disable unchecked checkboxes where item cannot perform the selected action
            
            var disabled = true;
            $("[data-mass-action-checkbox]:checked").each(function() {
                if (isPerformable($(this), $action_select.val())) {
                    disabled = false;
                }
            });
            if (disabled) {
                $submit.prop("title", "None of the selected items can perform selected action.")
            } else {
                $submit.prop("title", "")
            }
            $submit.prop("disabled", disabled);
            
            $("[data-mass-action-checkbox]").each(function() {
                var $this = $(this);
                var $list_item = $this.closest("[data-list-item]");
                
                disabled = !isPerformable($this, $action_select.val());
                if (disabled) {
                    $this.prop("title", "Item can't perform selected action.")
                    $list_item.addClass("work-list-item-disabled");
                } else {
                    $this.prop("title", "");
                    $list_item.removeClass("work-list-item-disabled");
                }
                if ($list_item.find("[data-error-message]").text().length === 0) {
                    $list_item.removeClass("alert alert-danger")
                }
                if ($this.is(":not(:checked)")) {
                    $this.prop("disabled", disabled);
                } else if (disabled) {
                    $list_item.addClass("alert alert-danger");
                }
            });
        };
        
        preprocessMassAction();
        $("[data-mass-action-checkbox]").off("click").on("click", preprocessMassAction);
        $action_select.off("change").off("change").on("change", preprocessMassAction);
        
        $("[data-select-checkbox]").off("click").on("click", function() {
            $(this).closest("[data-list-item]").find("[data-mass-action-checkbox]").click();
        });
        
        // submit
        $submit.off("click").on("click", function() {
            var $btn = $(this);
            var action = $action_select.val().toLowerCase();
            var $spinner = $("[data-mass-action-spinner]");
            var $checkboxes = $("[data-mass-action-checkbox]:checked");
            
            $.ajax({
                type: "post",
                url : baseUrl + "/work_item_mass_submit",
                dataType: "json",
                data : {
                    items : $checkboxes.map(function() { return $(this).data("massActionCheckbox"); }).toArray(),
                    action: action,
                    is_ajax: true,
                    __csrf_token: lupa.antiCSRFToken()
                },
                beforeSend : function() {
                    $btn.prop("disabled", true);
                    $spinner.show();
                },
                success : function(response) {
                    // clear errors
                    $checkboxes.each(function() {
                        var $item = $(this).closest("[data-list-item]");
                        $item.find("[data-error-message]").text("");
                        $item.removeClass("alert alert-danger");
                    });
                    // set errors
                    var first = true;
                    response.error_items.forEach(function(id) {
                        var err_key = "i" + id;
                        var err_msg = err_key in response.error_messages ? response.error_messages[err_key] : undefined;
                        self.onItemSubmitError(first, undefined, baseUrl, $("[data-list-item=\"" + id + "\"]"), err_msg);
                        first = false;
                    });
                    // handle succeeded items
                    first = true;
                    $checkboxes.each(function() {
                        var $this = $(this);
                        var $item = $this.closest("[data-list-item]");
                        if (!$item.hasClass("alert-danger")) {
                            self.onItemSubmitSuccess(first, undefined, $item, response, baseUrl);
                            $this.prop("checked", false);
                            first = false;
                        }
                    });
                },
                error : function() {
                    self.onItemSubmitError(true, $btn, baseUrl);
                },
                complete : function() {
                    $spinner.hide();
                    preprocessMassAction();
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
                        self.onItemNotesSuccess($item, baseUrl);
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
    onItemSubmitSuccess : function(firstOfMass, $btn, $item, response, baseUrl) {
        if (firstOfMass) lupa.refreshAntiCSRFToken(baseUrl);
        if ($btn) $btn.text("DONE");
        $item.delay(250).fadeOut(250, function() {
            $item.remove();
        });
        this.updateItemCounts(response.item_counts);
        if ("notes_success" in response && !response.notes_success) {
            window.alert("Progress was saved successfully but notes failed. Notes (copy them now because they will be lost): " + $item.find("[data-item-notes]").val());
        }
    },
    onItemSubmitError : function(firstOfMass, $btn, baseUrl, $item, itemError) {
        if (firstOfMass) {
            lupa.refreshAntiCSRFToken(baseUrl);
            window.alert("Sorry, but an error has occurred. Please try again and if the problem persists, refresh the page.");
        }
        if ($btn) $btn.prop("disabled", false);
        if (typeof $item !== "undefined") {
            $item.addClass("alert alert-danger");
            if (typeof itemError !== "undefined") {
                $item.find("[data-error-message]").text(itemError);
            }
        }
    },
    onItemNotesSuccess : function($item, baseUrl) {
        lupa.refreshAntiCSRFToken(baseUrl);
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
    },
    initLogoutForm : function() {
        $("[data-logout-form]").off("submit").on("submit", function() {
            $(this).find("[data-csrf-token]").val(lupa.antiCSRFToken());
        });
    }
};
