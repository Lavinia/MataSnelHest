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