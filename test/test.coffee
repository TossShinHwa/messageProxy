describe "on", ->
  it "should add listener when sources is string", (done) ->
    messageProxy.on 'name', ->
    done()
  
describe "emit", ->
  it "should emit event when targets is string", (done) ->
    messageProxy.emit 'name', 'a message to 4000'
    done()