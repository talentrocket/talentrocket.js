rest = require('rest')

root = exports ? this
root.talentrocket = {}

exports = root.talentrocket

class Request
  @get: (url) ->
    request = 
      path: "https://api.talentrocket.io/v1#{url}", 
      method: 'GET'
    
    rest(request).then (response) ->
      console.log response

class Profile
  constructor: (json) ->
    @json = json

  toJson: ->
    @json

  @find_by: (opts) ->
    Request.get("/profiles?search=#{opts['name']}")


class Project
  constructor: ->

  toJson: ->
    @json

  @find: (name) ->
    console.log name

exports.Profile = Profile
exports.Project = Project
