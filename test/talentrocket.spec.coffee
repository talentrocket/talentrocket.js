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

  describe 'find_by', ->
    json =
      name: 'George'

    it 'return profile', ->
      talentrocket.Config.set_api_key('xxx')
      talentrocket.Profile.find_by (name: 'georgedrummond'), (response) ->
        expect(response).to.eql 33
