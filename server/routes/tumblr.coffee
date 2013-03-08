config    = require("./config").tumblr
Tumblr    = require("tumblr").Tumblr
t         = new Tumblr config.blog, config.OauthConsumerKey

#======================================================================= ROUTES

express   = require "express"
app       = module.exports = express()
base_url  = "/tumblr"

# BLOG INFO
# http://www.tumblr.com/docs/en/api/v2#blog-info
app.get "#{base_url}", (req, res)->
  t.info (err, tumblRes)->
    throw new Error err if err
    res.jsonp tumblRes

# BLOG AVATAR
# http://www.tumblr.com/docs/en/api/v2#blog-avatar
# http:/api.tumblr.com/v2/blog/#{config.blog}/avatar

# BLOG POSTS
# http://www.tumblr.com/docs/en/api/v2#posts
app.get "#{base_url}/posts", (req, res)->
  options = req.query or {}
    
  t.posts options, (err, tumblRes)->
    throw new Error err if err
    res.jsonp tumblRes
