wp.workList = {
    init : function(baseUrl) {
        $("[data-item-action]").on("click", function() {
            var $btn = $(this)
            var action = $btn.data("item-action").toLowerCase();
            var spinnerClass = $.inArray(action, [ "archive", "halt", "notes" ]) !== -1 ? action : "action";
            var $item = $btn.closest("[data-list-item]");
            var $spinner = $item.find("[data-item-" + spinnerClass + "-spinner]");
            
            var onErr = function() {
                alert("Sorry, but an error has occured. Please try again or refresh the page.");
                $btn.prop("disabled", false);
            };
            
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
                        $btn.text("DONE");
                        $item.delay(250).fadeOut(250, function() {
                            $item.remove();
                        });
                    } else {
                        onErr();
                    }
                },
                error : function() {
                    onErr();
                },
                complete : function() {
                    $spinner.hide();
                }
            });
        });
    }
};
