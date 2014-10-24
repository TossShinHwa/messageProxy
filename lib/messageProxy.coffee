do (window) ->
  messageProxy =
    on: (name, source, listener) ->

    emit: (name, target, args) ->

    destroy: (name) ->

    _listeners: {}


  window.messageProxy = window.messageProxy || messageProxy