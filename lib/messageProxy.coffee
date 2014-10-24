do (window) ->
  messageProxy =
    on: (sources, listener) ->
      return  unless typeof listener is 'function'
      if sources = _parseToArray(sources)
        window.addEventListener "message", (event) ->
          if event.origin in sources
            listener(event.data)
        , false

    emit: (targets, message) ->
      if arguments.length is 1
        message = arguments[0]
        targets = [ '*' ]
      return  unless typeof message is 'string' #todo 应支持任意obj
      if targets = _parseToArray(targets)
        window.postMessage message, target for target in targets

  _isArray = (obj) ->
    Object.prototype.toString.call(obj) is '[object Array]'

  _parseToArray = (obj) ->
    obj = [ obj ] if typeof handler is 'string'
    if _isArray(obj) then obj else false

  window.messageProxy = window.messageProxy || messageProxy