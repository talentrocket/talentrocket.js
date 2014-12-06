rest = require('rest')

root = exports ? this
root.api = {}

exports = root.api

class Config
  @set_api_key: (@api_key) ->

class Request
  @get: (url, callback) ->
    request = 
      path: "https://api.talentrocket.io/v1#{url}&access_token=#{Config.api_key}", 
      method: 'GET'

    console.log request
    
    rest(request).then (response) ->
      callback(response)

class Profile
  constructor: (json) ->
    @json = json

  toJson: ->
    @json

  @find_by: (opts, callback) ->
    Request.get("/profiles/search?username=#{opts['name']}", callback)

class Project
  constructor: ->

  toJson: ->
    @json

  @find: (name) ->

exports.Config  = Config
exports.Profile = Profile
exports.Project = Project
