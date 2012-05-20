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
			@need.energy().should.equal 51.29
		
		it 'calculates energy need for easily fed horses', ->
			@horse.feedType = 'easy'
			@need.energy().should.equal 48.85
		
		it 'calculates energy need for hard fed horses', ->
			@horse.feedType = 'hard'
			@need.energy().should.equal 53.74
		
		it 'takes into account the gender of the horse', ->
			@horse.setGender 'stallion'
			@need.energy().should.equal 56.42
		
	describe 'calculate protein', ->
		it 'calculates the protein need in grams based on six times the energy need', ->
			@need.energy = -> 50
			@need.protein().should.equal 300.00
	
	describe 'calculate calcium', ->
		it "calculates the calcium need in grams based on the horse's weight", ->
			@need.calcium().should.equal 18.00
		
	describe 'calculate phosphor', ->
		it "calculates the phosphor need in grams based on the horse's weight", ->
			@need.phosphor().should.equal 12.60
	
	describe 'calculate magnesium', ->
		it "calculates the magnesium need in grams based on the horse's weight", ->
			@need.magnesium().should.equal 6.75
	
	describe 'calculate selenium', ->
		it "calculates the selenium need in milligrams based on the horse's weight", ->
			@need.selenium().should.equal 0.90
