$ = jQuery
manager_lookup = [];
manager_store = [];
$.manager =
  invoke: (selector) ->
    if $(selector).length > 0
      ready_call_list = manager_store[selector]
      $.each ready_call_list, ->
        @call()  if $.isFunction(this)
  exec: ->
    $.each manager_lookup, (index, selector) ->
      if $(selector).length > 0
        ready_call_list = manager_store[selector]
        $.each ready_call_list, ->
          @call()  if $.isFunction(this)
  ready: (selector, ready_func) ->
    unless manager_store[selector]
      manager_store[selector] = []
      manager_lookup.push selector
    manager_store[selector].push ready_func
