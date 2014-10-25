describe "on", ->
  it "should add listener when sources is string", (done) ->
    messageProxy.on 'http://localhost:3000', ->
    done()
  it "should add listener when sources is array", (done) ->
    messageProxy.on ['http://localhost:3000', 'http://localhost:3001'], ->
    done()
  it "should error to add listener when sources is object", (done) ->
    messageProxy.on {}, ->
    done()

describe "emit", ->
  it "should emit event", (done) ->
    messageProxy.emit 'a message to all'
    done()
  it "should emit event when targets is string", (done) ->
    messageProxy.emit 'http://localhost:4000', 'a message to 4000'
    done()
  it "should emit event when targets is array", (done) ->
    messageProxy.emit ['http://localhost:4000', 'http://localhost:4001'], 'a message to 4000 & 4001'
    done()