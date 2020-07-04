wp.workList = {
    init : function(baseUrl) {
        $("[data-item-action]").on("click", function() {
            var $btn = $(this)
            var action = $btn.data("item-action");
            var spinnerClass = $.inArray(action, [ "archive", "halt" ]) ? action : "action";
            var $item = $btn.closest("[data-list-item]");
            var $spinner = $item.find("[data-item-" + action + "-spinner]");
            
            $.ajax({
                type: "post",
                url : baseUrl + "/work_item_submit",
                data : {
                    item : $btn.data("item"),
                    action: action
                },
                beforeSend : function() {
                    $btn.prop("disabled", true);
                    $spinner.animate({opacity : 1});
                },
                success : function(html) {
                    $btn.text("DONE");
                    $item.delay(500).fadeOut(600, function() {
                        $item.remove();
                    });
                },
                error : function() {
                    alert("Sorry, but an error has occured. Please try again later.");
                    $btn.prop("disabled", false);
                },
                complete : function() {
                    $spinner.animate({opacity : 0});
                }
            });
        });
    }
};