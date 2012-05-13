chai = require 'chai'
chai.should()
expect = chai.expect

{Horse} = require '../coffeescript/horse'

describe 'Horse', ->
	beforeEach ->
		@horse = new Horse
	
	describe 'weight', ->
		it 'should start as null', ->
			expect(@horse.weight).to.be.null
		
		it 'should be able to be set', ->
			@horse.setWeight 500
			@horse.weight.should.equal 500
		
		it 'should be able to be set from a string', ->
			@horse.setWeight '400'
			@horse.weight.should.equal 400
		
		it 'should throw an exception without changing the weight when specifying a non-number', ->
			@horse.setWeight 600
			weightInLetters = '500andtwentyseven'
			(=> @horse.setWeight weightInLetters).should.throw "#{weightInLetters} is not a valid number"
			@horse.weight.should.equal 600
		
	
	describe 'gender', ->
		it 'should be null from the start', ->
			expect(@horse.gender).to.be.null
		
		it 'should be able to be a mare', ->
			@horse.setGender 'mare'
			@horse.gender.should.equal 'mare'
		
		it 'should be able to be a stallion', ->
			@horse.setGender 'stallion'
			@horse.gender.should.equal 'stallion'
		
		it 'should be able to be a gelding', ->
			@horse.setGender 'gelding'
			@horse.gender.should.equal 'gelding'
		
		it 'should not be able to be another gender', ->
			genderBender = 'shemale'
			(=> @horse.setGender genderBender).should.throw "#{genderBender} is not a valid horse gender"
		
	
	describe 'feedType', ->
		it 'should be normal from the start', ->
			@horse.feedType.should.equal 'normal'
		
		it 'should be able to be hard to feed', ->
			@horse.setFeedType 'hard'
			@horse.feedType.should.equal 'hard'
		
		it 'should be able to be normal to feed', ->
			@horse.setFeedType 'normal'
			@horse.feedType.should.equal 'normal'
		
		it 'should be able to be easy to feed', ->
			@horse.setFeedType 'easy'
			@horse.feedType.should.equal 'easy'
		
		it 'should not be able to have another feed type', ->
			nonFeedType = 'cumbersome'
			(=> @horse.setFeedType nonFeedType).should.throw "#{nonFeedType} is not a valid horse feed type"
			