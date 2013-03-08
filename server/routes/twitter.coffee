config  = require("./config").twitter
twitter = require "twitter"
twit    = new twitter config
debugger
#======================================================================== Routes
util    = require "util"
express = require "express"
app     = module.exports = express()

app.get "/twitter", (req, res)-> 
  res.send "t.index"

app.get "/twitter/:userid/status", (req, res)->
  twit.get '/statuses/#{req.params.userid}.json', include_entities:true, (data)->
    console.log "t.status(#{req.params.userid})"
    console.log util.inspect(data)
    res.send data

app.get "/twitter/:userid/status/:statusid", (req, res)-> 
  twit.get '/statuses/show/#{req.params.statusid}.json', include_entities:true, (data)->
    console.log "t.status(#{req.params.userid}, #{req.params.statusid})"
    console.log util.inspect(data)
    res.send data

app.get "/twitter/:id/status/stream", (req, res)->
  onData = (data)-> 
    console.log util.inspect(data)
    
  twit.stream 'statuses/#{req.params.id}', (stream)->
    stream.on 'data', onData
    res.send "t.statusStream(#{req.params.id})"