describe "Publisher", ->
  it "should publish packages", (done) ->
    Publisher = require "../main"

    publisher = Publisher(JSON.parse(localStorage.FSPolicy))

    publisher.publish("testy", PACKAGE)
    .then (url) ->
      console.log url
      done()
    , (e) ->
      console.error e
