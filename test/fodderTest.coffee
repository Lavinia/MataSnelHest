chai = require 'chai'
chai.should()
expect = chai.expect

{Fodder} = require '../coffeescript/fodder'

describe 'Fodder', ->
  
  beforeEach ->
    @fodder = new Fodder    
    
  describe 'name', ->
    it 'should be null from the beginning', ->
      expect(@fodder.name).to.be.null
        
    it 'should be able to be set', ->
      @fodder.setName 'hö'
      @fodder.name.should.equal 'hö'
    
  describe 'solids', ->
    it 'should be null from the beginning', ->
      expect(@fodder.solids).to.be.null
    
    it 'should be able to be set', ->
      @fodder.setSolids 84
      @fodder.solids.should.equal 84
  
  describe 'energy', ->
    it 'should be null from the beginning', ->
      expect(@fodder.energy).to.be.null
    
    it 'should be able to be set', ->
      @fodder.setEnergy 84
      @fodder.energy.should.equal 84
    