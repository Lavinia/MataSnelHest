chai = require 'chai'
chai.should()
expect = chai.expect

{FodderList} = require '../coffeescript/fodderList'
{Fodder} = require '../coffeescript/fodder'

describe 'FodderList', ->
  it 'can have elements appended', ->
    fodderList = new FodderList
    fodder1 = { name: "hö" }
    fodder2 = { name: "havre" }
    fodderList.append fodder1
    fodderList.append fodder2
    fodderList[0].should.equal fodder1
    fodderList[1].should.equal fodder2

  it 'can return the last index', ->
    fodderList = new FodderList
    fodderList.append { name: 'soja '}
    fodderList.lastIndex().should.equal 0