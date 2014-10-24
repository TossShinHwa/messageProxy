do (window) ->
  messageProxy =
    on: (sources, listener) ->
      sources = [ sources ]  unless _isArray(sources)
      window.addEventListener "message", (event) ->
        if event.origin in sources
          listener(event.data)
      , false

    emit: (targets, message) ->
      targets = [ targets ]  unless _isArray(targets)
      window.postMessage message, target for target in targets
      
  _isArray = (obj) ->
    Object.prototype.toString.call(obj) is '[object Array]'

  window.messageProxy = window.messageProxy || messageProxy