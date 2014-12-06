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
      talentrocket.api_key('securekey+++')
    
    it 'remains set', ->
      expect(talentrocket.api_key).to.eql 'securekey+++'

describe 'Profile', ->
  describe 'find_by', ->
    json =
      name: 'George'

    before ->
      nock('https://api.talentrocket.io')
          .get('/v1/profiles')
          .reply(200, json)

    it 'return profile', ->
      talentrocket.Profile.find_by (name: 'name'), (response) ->
        expect(response.entity).to.eql 33
