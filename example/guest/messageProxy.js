(function(window) {
  var messageProxy, _isArray, _parseToArray, _splitCode;
  messageProxy = {
    on: function(name, listener) {
      if (typeof name !== 'string') {
        return;
      }
      if (typeof listener !== 'function') {
        return;
      }
      return window.addEventListener("message", function(event) {
        var eventName, msg, _ref;
        _ref = event.data.split(_splitCode), eventName = _ref[0], msg = _ref[1];
        if (eventName === name) {
          return listener(msg);
        }
      }, false);
    },
    emit: function(name, message) {
      var frame, _i, _len, _ref, _results;
      if (typeof name !== 'string') {
        return;
      }
      if (typeof message !== 'string') {
        return;
      }
      _ref = window.frames;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        frame = _ref[_i];
        _results.push(frame.postMessage(name + _splitCode + message,'*'));
      }
      return _results;
    }
  };
  _isArray = function(obj) {
    return Object.prototype.toString.call(obj) === '[object Array]';
  };
  _parseToArray = function(obj) {
    if (typeof handler === 'string') {
      obj = [obj];
    }
    if (_isArray(obj)) {
      return obj;
    } else {
      return false;
    }
  };
  _splitCode = '|messageProxy|';
  return window.messageProxy = window.messageProxy || messageProxy;
})(window);
