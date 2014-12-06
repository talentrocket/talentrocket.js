require 'coffee-errors'

chai  = require('chai')
sinon = require('sinon')
nock  = require('nock')

talentrocket = require('../lib/talentrocket.js').api

expect = chai.expect
chai.use require 'sinon-chai'

describe 'talentrocket', ->
  describe 'setting api_key', ->
    before ->
      talentrocket.Config.set_api_key('securekey+++')
    
    it 'remains set', ->
      expect(talentrocket.Config.api_key).to.eql 'securekey+++'

describe 'Profile', ->
  before ->
    talentrocket.Config.set_api_key('XXX')
  
  describe 'find_by', ->
    before ->
      nock('https://api.talentrocket.io:443')
        .get('/v1/profiles/search?username=georgedrummond&access_token=XXX')
        .reply(200, {"id":"c2e790b4-3afd-4c18-bc55-9edfe553b0b3","name":"George Drummond","email":"georgedrummond@gmail.com","email_hash":"d278a12b969a495ab16fdd942e748fe5","gravatar_url":"https://secure.gravatar.com/avatar/d278a12b969a495ab16fdd942e748fe5","api_url":"https://api.talentrocket.io/v1/profiles/c2e790b4-3afd-4c18-bc55-9edfe553b0b3","profiles":[],"projects":[]})

    it 'return profile', ->
      talentrocket.Profile.find_by (name: 'georgedrummond'), (response) ->
        expect(response.email).to.eql 'georgedrummond@gmail.com'

describe 'Project', ->
  before ->
    talentrocket.Config.set_api_key('XXX')

  describe 'find', ->
    before ->
      nock('https://api.talentrocket.io:443')
        .get('/v1/projects/github_repositories/search?name=georgedrummond%2Flearning-go&access_token=XXX')
        .reply(200, {"id":"723296bd-8f0f-427d-82ca-00f36bb33abf","name":"georgedrummond/learning-go"})

    it 'return json', ->
      talentrocket.Project.find (name: 'georgedrummond/learning-go'), (response) ->
        expect(response.id).to.eql '723296bd-8f0f-427d-82ca-00f36bb33abf'

  describe 'create', ->
    before ->
      nock('https://api.talentrocket.io:443')
        .post('/v1/projects/github_repositories?name=georgedrummond%2Flearning-go&access_token=XXX')
        .reply(200, {"id":"723296bd-8f0f-427d-82ca-00f36bb33abf","name":"georgedrummond/learning-go"})

    it 'return json', ->
      talentrocket.Project.create (name: 'georgedrummond/learning-go'), (response) ->
        expect(response.id).to.eql '723296bd-8f0f-427d-82ca-00f36bb33abf'
