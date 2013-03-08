http = require("http")
#
#  Dribbble.js is a client for the Dribbble's API (http://http://dribbble.com/api)
#  Usage:
#      var dribbble = require('dribbble');
#      var callback = function(err, shot){
#          if(!err) console.log(shot);
#      }
#      
#      dribbble.shots(21603, callback);
#
#  When is required the :id param this can be `1` or `simplebits`
#
http = require("http")
sys = require("sys")
log = sys.log
inspect = sys.inspect
request = require("request")
BASE_URL = "www.api.dribbble.com"
dribbble = exports

#
# Default value of pages in the pagination
#
dribbble.PER_PAGE = 15

#
# This function get the shot for a espeficed :id, then call the callback with
# callback = function(shot, err). `shot` is a object all informaction about the shot.
# If any error then `err` is not null.
#
dribbble.shot = (id, callback) ->
  URL = "/shots/" + id
  getJSON URL, (data) ->
    if data.message is "Not found"
      callback data
    else
      callback null, data



#
#  This function get the rebounds for a shot :id. Then call the callback to process the result o throw a exception
#
dribbble.rebounds = (id, callback) ->
  URL = "shots/" + id + "/rebounds"
  getJSON URL, (data) ->
    if data.message is "Not found"
      callback data
    else
      callback null, data



#
#  This function returns the set of comments for the shot specified by :id.
#  then call the callback with all comments in a object
#
dribbble.comments = (id, callback) ->
  URL = "shots/" + id + "/comments"
  getJSON URL, (data) ->
    if data.message is "Not found"
      callback data
    else
      callback null, data



#
#  This function returns the specified list of shots where :list has one of the following 
#  values € {debuts, everyone, popular}. If is not a correct value throw a exception.
#  This function support pagination, then you can supply a page number. Default value per page is dribbble.PER_PAGE
#
dribbble.list = (value, page, callback) ->
  URL = "shots/" + value
  getJSON URL, (data) ->
    if data.message is "Not found"
      callback data
    else
      callback null, data



#
#  Returns the most recent shots for the player specified by :id.
#  This function support pagination, then you can supply a page number. Default value elements per page is dribbble.PER_PAGE
#
dribbble.shots_for_player = (id, page, callback) ->
  URL = "/players/" + id + "/shots"
  getJSON URL, (data) ->
    if data.message is "Not found"
      callback data
    else
      callback null, data



#
#  This function returns the most recent shots published by those the player specified by :id is following.
#  This function support pagination, then you can supply a page number. Default value elements per page is dribbble.PER_PAGE
#
dribbble.shots_following_for_player = (id, page, callback) ->
  URL = "/players/" + id + "/shots/following"
  getJSON URL, (data) ->
    if data.message is "Not found"
      callback data
    else
      callback null, data



#
#  This function Returns shots liked by the player specified by :id.
#  This function support pagination, then you can supply a page number. Default value elements per page is dribbble.PER_PAGE
#
dribbble.shots_likes_for_player = (id, page, callback) ->
  URL = "/players/" + id + "/shots/likes"
  getJSON URL, (data) ->
    if data.message is "Not found"
      callback data
    else
      callback null, data



#
#  This function returns profile details for a player specified by :id.
#
dribbble.player = (id, callback) ->
  URL = "/players/" + id
  getJSON URL, (data) ->
    if data.message is "Not found"
      callback data
    else
      callback null, data



#
#  This function Returns the list of followers for a player specified by :id.
#
dribbble.player_followers = (id, callback) ->
  URL = "/players/" + id + "followers"
  getJSON URL, (data) ->
    if data.message is "Not found"
      callback data
    else
      callback null, data



#
#  This function Returns the list of players followed by the player specified by :id.
#
dribbble.player_following = (id, callback) ->
  URL = "/players/" + id + "following"
  getJSON URL, (data) ->
    if data.message is "Not found"
      callback data
    else
      callback null, data



#
#  This function Returns the list of players drafted by the player specified by :id.
#
dribbble.player_draftees = (id, callback) ->
  URL = "/players/" + id + "draftees"
  getJSON URL, (data) ->
    if data.message is "Not found"
      callback data
    else
      callback null, data



#/ ----------------------- PRIVATE FUNCTIONS -----------------

#
#  Get JSON from :url and pass a JS object.
#
getJSON = (url, callback) ->
  options = 
    uri: "http://#{BASE_URL}#{url}"
    
  request options, (error, response, body) ->
    try
      callback JSON.parse(body)
    catch e
      callback response.statusCode
