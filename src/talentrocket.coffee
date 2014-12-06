rest   = require('rest')
encode = require('rest/mime/type/application/x-www-form-urlencoded')

root = exports ? this
root.api = {}

exports = root.api

class Config
  @set_api_key: (@api_key) ->

class Request
  @make: (url, opts, callback) ->
    opts['path'] = "https://api.talentrocket.io/v1#{url}"
    opts['params'] ? {}
    opts['params']['access_token'] = Config.api_key

    rest(opts).then (response) ->
      callback JSON.parse(response.entity)

class Profile
  constructor: (json) ->
    @json = json

  toJson: ->
    @json

  @find_by: (opts, callback) ->
    Request.make("/profiles/search", { method: 'GET', params: { username: opts['name'] } }, callback)

class Project
  @find: (opts, callback) ->
    Request.make("/projects/github_repositories/search", { method: 'GET', params: { name: opts['name'] } }, callback)

  @create: (opts, callback) ->
    Request.make("/projects/github_repositories", { method: "POST", params: { name: opts['name'] } }, callback)

exports.Config  = Config
exports.Profile = Profile
exports.Project = Project
