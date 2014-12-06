rest = require('rest')

root = exports ? this
root.api = {}

exports = root.api

api_key = (@api_key) ->

class Request
  @get: (url, callback) ->
    request = 
      path: "https://api.talentrocket.io/v1#{url}", 
      method: 'GET'
    
    rest(request).then (response) ->
      callback(response)

class Profile
  constructor: (json) ->
    @json = json

  toJson: ->
    @json

  @find_by: (opts, callback) ->
    #Request.get("/profiles?search=#{opts['name']}")
    Request.get('/profiles', callback)

class Project
  constructor: ->

  toJson: ->
    @json

  @find: (name) ->

exports.api_key = api_key
exports.Profile = Profile
exports.Project = Project
