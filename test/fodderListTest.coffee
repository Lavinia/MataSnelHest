chai = require 'chai'
chai.should()
expect = chai.expect

{FodderList} = require '../coffeescript/fodderList'
{Fodder} = require '../coffeescript/fodder'

describe 'FodderList', ->
  it 'can have elements appended', ->
    fodderList = new FodderList
    fodder1 = new Fodder { name: "hö" }
    fodder2 = new Fodder { name: "havre" }
    fodderList.append fodder1
    fodderList.append fodder2
    fodderList.getFodderByIndex(0).should.equal fodder1
    fodderList.getFodderByIndex(1).should.equal fodder2

  it 'can return the last index', ->
    fodderList = new FodderList
    fodderList.append new Fodder { name: 'soja '}
    fodderList.lastIndex().should.equal 0

  it 'calculates the total nutrition in all fodders', ->
    fodderList = new FodderList
    fodderList.append new Fodder { amount: 2, energy: 1, solids: 60, protein: 3, calcium: 4, phosphor: 5, magnesium: 6, selenium: 7 }
    fodderList.append new Fodder { amount: 3, energy: 2, solids: 30, protein: 4, calcium: 5, phosphor: 6, magnesium: 7, selenium: 8 }
    fodderList.calculate().should.eql {energy: 8, solids: 2.1, protein: 18, calcium: 23, phosphor: 28, magnesium: 33, selenium: 38}

  it 'returns a fodder list with only zeroes if no fodders are in there', ->
    fodderList = new FodderList
    fodderList.calculate().should.eql {energy: 0, solids: 0, protein: 0, calcium: 0, phosphor: 0, magnesium: 0, selenium: 0}

  it 'calculates the total nutrition correctly when some nutrients are left out.', ->
    fodder1 = { amount: 2, solids: 84, calcium: 4.5, magnesium: 6, selenium: 7 }
    fodder2 = { amount: 3, energy: 2, solids: 55, protein: 4, calcium: 5, phosphor: 6, magnesium: 7, selenium: 8 }
    expected = { energy: 6, solids: 3.33, protein: 12, calcium: 24, phosphor: 18, magnesium: 33, selenium: 38 }

    fodderList = new FodderList
    fodderList.append new Fodder fodder1
    fodderList.append new Fodder fodder2

    fodderList.calculate().should.eql expected

  it 'calculates the energy protein quotient', ->
    fodder = { amount: 1, energy: 5.4, protein: 22 }
    fodderList = new FodderList
    fodderList.append new Fodder fodder
    fodderList.calculateQoutient(fodder.protein, fodder.energy).should.eql 4.1

  it 'calculates the energy protein quotient', ->
    fodder = { amount: 1, calcium: 3.7, phosphor: 2.2 }
    fodderList = new FodderList
    fodderList.append new Fodder fodder
    fodderList.calculateQoutient(fodder.calcium, fodder.phosphor).should.eql 1.7

  it 'returns an empty string when nutrients are missing in quotient', ->
    fodder = { amount: 1, phosphor: 2.2 }
    fodderList = new FodderList
    fodderList.append new Fodder fodder
    fodderList.calculateQoutient(fodder.calcium, fodder.phosphor).should.eql ""
