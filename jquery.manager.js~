(function() {
    var $, manager_lookup, manager_store;
    $ = jQuery;
    manager_lookup = [];
    manager_store = [];
    $.manager = {
        invoke: function(selector) {
            var ready_call_list;
            if ($(selector).length > 0) {
                ready_call_list = manager_store[selector];
                return $.each(ready_call_list, function() {
                    if ($.isFunction(this)) {
                        return this.call();
                    }
                });
            }
        },
        exec: function() {
            return $.each(manager_lookup, function(index, selector) {
                var ready_call_list;
                if ($(selector).length > 0) {
                    ready_call_list = manager_store[selector];
                    return $.each(ready_call_list, function() {
                        if ($.isFunction(this)) {
                            return this.call();
                        }
                    });
                }
            });
        },
        ready: function(selector, ready_func) {
            if (!manager_store[selector]) {
                manager_store[selector] = [];
                manager_lookup.push(selector);
            }
            return manager_store[selector].push(ready_func);
        }
    };
    $.manager.ready('.legal_footer', function() {
        return alert("something ready ran.");
    });
    $.manager.invoke('.legal_footer');
    $.manager.exec();
}).call(this); 
