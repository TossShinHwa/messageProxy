do (window) ->
  messageProxy =
    on: (name, listener) ->
      return  unless typeof name is 'string'
      return  unless typeof listener is 'function'
      window.addEventListener "message", (event) ->
        [eventName, msg] = event.data.split(_splitCode)
        listener(msg)  if eventName is name
      , false

    emit: (name, message) ->
      return  unless typeof name is 'string'
      return  unless typeof message is 'string' #todo support obj
      for frame in window.frames
        frame.postMessage name + _splitCode + message, '*' #todo 若要需要防止恶意iframe监听消息, 可考虑加密msg内容

  _splitCode = '|messageProxy|' #todo 使用转为object再序列化/反序列化方式将更安全

  window.messageProxy = window.messageProxy || messageProxy