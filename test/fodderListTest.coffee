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
    fodderList.getFodderByIndex(0).should.equal fodder1
    fodderList.getFodderByIndex(1).should.equal fodder2

  it 'can return the last index', ->
    fodderList = new FodderList
    fodderList.append { name: 'soja '}
    fodderList.lastIndex().should.equal 0

  it 'calculates the total nutrition in all fodders', ->
    fodderList = new FodderList
    fodderList.append { amount: 2, energy: 1, solids: 2, protein: 3, calcium: 4, phosphor: 5, magnesium: 6, selenium: 7 }
    fodderList.append { amount: 3, energy: 2, solids: 3, protein: 4, calcium: 5, phosphor: 6, magnesium: 7, selenium: 8 }
    fodderList.calculate().should == {energy: 16, solids: 8, protein: 13, calcium: 18, phosphor: 28, magnesium: 43, selenium: 38}

  it 'returns a fodder list with only zeroes if no fodders are in there', ->
    fodderList = new FodderList
    fodderList.calculate().should == {energy: 0, solids: 0, protein: 0, calcium: 0, phosphor: 0, magnesium: 0, selenium: 0}

  it 'calculates the total nutrition correctly when some nutrients are left out.', ->
    fodderList = new FodderList
    fodderList.append { amount: 2, solids: 2, calcium: 4, magnesium: 6, selenium: 7 }
    fodderList.append { amount: 3, energy: 2, solids: 3, protein: 4, calcium: 5, phosphor: 6, magnesium: 7, selenium: 8 }
    fodderList.calculate().should == {energy: 6, solids: 8, protein: 12, calcium: 18, phosphor: 18, magnesium: 43, selenium: 38}

    # 0,4,0, 8, 0, 12,14
    # 6,9,12,15,18,31,24









