chai = require 'chai'
chai.should()
expect = chai.expect

{Fodder} = require '../coffeescript/fodder'

describe 'Fodder', ->
  it 'should be null from the beginning', ->
    fodder = new Fodder
    expect(fodder.name).to.be.null
    