(function(window) {
  var messageProxy;
  messageProxy = {
    on: function(name, source, listener) {},
    emit: function(name, target, args) {},
    destroy: function(name) {},
    _listeners: {}
  };
  return window.messageProxy = window.messageProxy || messageProxy;
})(window);
