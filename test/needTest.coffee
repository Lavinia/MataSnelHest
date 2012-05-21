chai = require 'chai'
chai.should()
expect = chai.expect

{Horse} = require '../coffeescript/horse'
{Need} = require '../coffeescript/need'

describe 'Need', ->
	beforeEach ->
		@horse = new Horse
		@horse.setWeight 450
		@horse.setGender 'mare'
		@horse.setFeedType 'normal'
		@need = new Need @horse
	
	it 'can be initialized with a Horse object', ->
		@need.horse.should.equal @horse
		
	describe 'calculate energy', ->
		it 'calculates energy need for normal horses', ->
			@need.energyInMJ().should.equal 51.29
		
		it 'calculates energy need for easily fed horses', ->
			@horse.feedType = 'easy'
			@need.energyInMJ().should.equal 48.85
		
		it 'calculates energy need for hard fed horses', ->
			@horse.feedType = 'hard'
			@need.energyInMJ().should.equal 53.74
		
		it 'takes into account the gender of the horse', ->
			@horse.setGender 'stallion'
			@need.energyInMJ().should.equal 56.42
		
	describe 'calculate protein', ->
		it 'calculates the protein need in grams based on six times the energy need', ->
			@need.energyInMJ = -> 50
			@need.proteinInGrams().should.equal 300.00
			
		it 'shows the result with 2 numbers in percision', ->
			@horse.setGender 'stallion'
			@horse.setFeedType 'hard'
			@need.proteinInGrams().should.equal 354.66
	
	describe 'calculate calcium', ->
		it "calculates the calcium need in grams based on the horse's weight", ->
			@need.calciumInGrams().should.equal 18.00
	
		it 'shows the result with 2 numbers in percision', ->
			@horse.setWeight 565.6
			@need.calciumInGrams().should.equal 22.62
		
	describe 'calculate phosphor', ->
		it "calculates the phosphor need in grams based on the horse's weight", ->
			@need.phosphorInGrams().should.equal 12.60
		
		it 'shows the result with 2 numbers in percision', ->
			@horse.setWeight 455
			@need.phosphorInGrams().should.equal 12.74
			
	describe 'calculate magnesium', ->
		it "calculates the magnesium need in grams based on the horse's weight", ->
			@need.magnesiumInGrams().should.equal 6.75
	
		it 'shows the result with 2 numbers in percision', ->
			@horse.setWeight 455
			@need.magnesiumInGrams().should.equal 6.82	
	
	describe 'calculate selenium', ->
		it "calculates the selenium need in milligrams based on the horse's weight", ->
			@need.seleniumInMilligrams().should.equal 0.90
		it 'shows the result with 2 numbers in percision', ->
			@horse.setWeight 612
			@need.seleniumInMilligrams().should.equal 1.22
	
	describe 'calculate solids', ->
		it "calculates the solids in kilos based on the horse's weight", ->
			@need.solidsInKilos().should.equal 6.75
		
		it 'shows the result with 2 numbers in percision', ->
			@horse.setWeight 455
			@need.solidsInKilos().should.equal 6.82
		