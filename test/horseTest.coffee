chai = require 'chai'
chai.should()
expect = chai.expect

{Horse} = require '../coffeescript/horse'

describe 'Horse', ->
	beforeEach ->
		@horse = new Horse
	
	describe 'weight', ->
		it 'should start as null', ->
			expect(@horse.weight).should.be.null
		
		it 'should be able to be set', ->
			@horse.setWeight 500
			@horse.weight.should.equal 500
		
		it 'should be able to be set from a string', ->
			@horse.setWeight '400'
			@horse.weight.should.equal 400
		
		it 'should throw an exception without changing the weight when specifying a non-number', ->
			@horse.setWeight 600
			weightInLetters = '500andtwentyseven'
			(=> @horse.setWeight(weightInLetters)).should.throw "#{weightInLetters} is not a number"
			@horse.weight.should.equal 600
		
