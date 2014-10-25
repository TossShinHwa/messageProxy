var __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

(function(window) {
  var messageProxy, _isArray, _parseToArray;
  messageProxy = {
    on: function(sources, listener) {
      debugger
      if (typeof listener !== 'function') {
        return;
      }
      if (typeof sources === 'string') {
        sources = [sources];
      }
      if (sources = _parseToArray(sources)) {
        return window.addEventListener("message", function(event) {
          debugger
          var _ref;
          if (_ref = event.origin, __indexOf.call(sources, _ref) >= 0) {
            return listener(event.data);
          }
        }, false);
      }
    },
    emit: function(targets, message) {
      var target, _i, _len, _results;
      if (arguments.length === 1) {
        message = arguments[0];
        targets = ['*'];
      }
      if (typeof message !== 'string') {
        return;
      }
      if (targets = _parseToArray(targets)) {
        _results = [];
        for (_i = 0, _len = targets.length; _i < _len; _i++) {
          target = targets[_i];
          _results.push(window.postMessage(message, target));
        }
        return _results;
      }
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
  return window.messageProxy = window.messageProxy || messageProxy;
})(window);
