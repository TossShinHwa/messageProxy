do (window) ->
  messageProxy =
    on: (name, source, listener)->

    emit: (name, target, args)->

    destroy: (name) ->

  window.messageProxy = window.messageProxy || messageProxy