express   = require "express"
app       = module.exports = express()
GitHubApi = require "github"
github    = new GitHubApi version: "3.0.0"
config    = require "./config"

options = config.github

github.authenticate
  type: "basic"
  username: options.username
  password: options.password
    
app.get "/github/:user/following", (req, res)->
  github.user.getFollowingFromUser user: req.params.user, (err, gres)->
    res.send gres
    #console.log JSON.stringify(res)