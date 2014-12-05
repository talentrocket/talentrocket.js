require 'coffee-errors'

chai = require 'chai'
sinon = require 'sinon'
# using compiled JavaScript file here to be sure module works
talentrocket = require '../lib/talentrocket.js'

expect = chai.expect
chai.use require 'sinon-chai'

describe 'talentrocket', ->
  it 'works', ->
    actual = talentrocket 'World'
    expect(actual).to.eql 'Hello World'
