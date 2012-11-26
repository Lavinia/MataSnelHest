chai = require 'chai'
chai.should()
expect = chai.expect

{Fodder} = require '../coffeescript/fodder'

describe 'Fodder', ->
  describe 'with initialization', ->
    it 'can be initialized with a set of values', ->
      fodder = new Fodder({name: 'silage', amount: 1, energy: 2, solids: 3, protein: 4, calcium: 5, phosphor: 6, magnesium: 7, selenium: 8 })
      fodder.name.should.equal 'silage'
      fodder.amount.should.equal 1
      fodder.energy.should.equal 2
      fodder.solids.should.equal 3
      fodder.protein.should.equal 4
      fodder.calcium.should.equal 5
      fodder.phosphor.should.equal 6
      fodder.magnesium.should.equal 7
      fodder.selenium.should.equal 8

  beforeEach ->
    @fodder = new Fodder

  describe 'name', ->
    it 'should be empty string from the beginning', ->
      @fodder.name.should.equal ''

    it 'should be able to be set', ->
      @fodder.setName 'hö'
      @fodder.name.should.equal 'hö'

  describe 'solids', ->
    it 'should be zero from the beginning', ->
      @fodder.solids.should.equal 0

    it 'should be able to be set', ->
      @fodder.setSolids '84'
      @fodder.solids.should.equal 84

    it 'throws an exception without changing the solids value, when given letters', ->
      @fodder.setSolids '34'
      solidsInLetters = 'åttiofyra'
      (=> @fodder.setSolids solidsInLetters).should.throw "#{solidsInLetters} is not a valid number"
      @fodder.solids.should.equal 34

    it 'replaces commas with dots if comma is given', ->
      @fodder.setSolids '3,2'
      @fodder.solids.should.equal 3.2

  describe 'energy', ->
    it 'should be 0 from the beginning', ->
      @fodder.energy.should.equal 0

    it 'should be able to be set', ->
      @fodder.setEnergy '84'
      @fodder.energy.should.equal 84

    it 'changes commas into dots.', ->
      @fodder.setEnergy '8,4'
      @fodder.energy.should.equal 8.4

    it 'throws an exception without changing the energy value, when given letters', ->
      @fodder.setEnergy '34'
      energyInLetters = 'tjugotvå'
      (=> @fodder.setEnergy energyInLetters).should.throw "#{energyInLetters} is not a valid number"
      @fodder.energy.should.equal 34


  describe 'protein', ->
    it 'should be 0 from the beginning', ->
      @fodder.protein.should.equal 0

    it 'should be able to be set', ->
      @fodder.setProtein '84'
      @fodder.protein.should.equal 84

    it 'throws an exception without changing the protein value, when given letters', ->
      @fodder.setProtein '34'
      proteinInLetters = 'tjugotvå'
      (=> @fodder.setProtein proteinInLetters).should.throw "#{proteinInLetters} is not a valid number"
      @fodder.protein.should.equal 34

  describe 'calcium', ->
    it 'should be 0 from the beginning', ->
      @fodder.calcium.should.equal 0

    it 'should be able to be set', ->
      @fodder.setCalcium '84'
      @fodder.calcium.should.equal 84

  it 'throws an exception without changing the calcium value, when given letters', ->
      @fodder.setCalcium '34'
      calciumInLetters = 'tjugotvå'
      (=> @fodder.setCalcium calciumInLetters).should.throw "#{calciumInLetters} is not a valid number"
      @fodder.calcium.should.equal 34

  describe 'phosphor', ->
    it 'should be 0 from the beginning', ->
      @fodder.phosphor.should.equal 0

    it 'should be able to be set', ->
      @fodder.setPhosphor '84'
      @fodder.phosphor.should.equal 84

    it 'throws an exception without changing the phosphor value, when given letters', ->
      @fodder.setPhosphor '34'
      phosphorInLetters = 'tjugotvå'
      (=> @fodder.setPhosphor phosphorInLetters).should.throw "#{phosphorInLetters} is not a valid number"
      @fodder.phosphor.should.equal 34

  describe 'magnesium', ->
    it 'should be 0 from the beginning', ->
      @fodder.magnesium.should.equal 0

    it 'should be able to be set', ->
      @fodder.setMagnesium '84'
      @fodder.magnesium.should.equal 84

    it 'throws an exception without changing the magnesium value, when given letters', ->
      @fodder.setMagnesium '34'
      magnesiumInLetters = 'tjugotvå'
      (=> @fodder.setMagnesium magnesiumInLetters).should.throw "#{magnesiumInLetters} is not a valid number"
      @fodder.magnesium.should.equal 34

  describe 'selenium', ->
    it 'should be 0 from the beginning', ->
      @fodder.selenium.should.equal 0

    it 'can be set', ->
      @fodder.setSelenium '84'
      @fodder.selenium.should.equal 84

    it 'throws an exception without changing the selenium value, when given letters', ->
      @fodder.setSelenium '34'
      seleniumInLetters = 'tjugotvå'
      (=> @fodder.setSelenium seleniumInLetters).should.throw "#{seleniumInLetters} is not a valid number"
      @fodder.selenium.should.equal 34

