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

		it 'should throw an exception without changing the weight when specifying a number below zero', ->
			@horse.setWeight 400
			negativeWeight = -200
			(=> @horse.setWeight negativeWeight).should.throw "#{negativeWeight} is not a valid weight"
			@horse.weight.should.equal 400

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

	describe 'workload', ->
		it 'should be zero from the start', ->
			@horse.workload.should.eql { daysPerWeek: 0, walk: 0, trot: 0 }

		it 'should be able to set the days per week', ->
			@horse.setWorkload 'daysPerWeek', 5
			@horse.workload.daysPerWeek.should.equal 5
			@horse.setWorkload 'daysPerWeek', 3
			@horse.workload.daysPerWeek.should.equal 3

		it 'should be able to set the walk', ->
			@horse.setWorkload 'walk', 30
			@horse.workload.walk.should.equal 30
			@horse.setWorkload 'walk', 60
			@horse.workload.walk.should.equal 60

		it 'should be able to set the trot', ->
			@horse.setWorkload 'trot', 5
			@horse.workload.trot.should.equal 5
			@horse.setWorkload 'trot', 25
			@horse.workload.trot.should.equal 25

		it 'should be able to set a combination of days per week and walk', ->
			@horse.setWorkload 'daysPerWeek', 4, 'walk', 50
			@horse.workload.should.eql { daysPerWeek: 4, walk: 50, trot: 0 }

		it 'should throw an exception without changing the workload when given a negative amount of walking', ->
			@horse.setWorkload 'walk', 60
			negativeWalk = -32
			(=> @horse.setWorkload 'walk', negativeWalk).should.throw "#{negativeWalk} is not a valid number"
			@horse.workload.walk.should.equal 60

		it 'should throw an exception without changing the workload when given a non number', ->
			@horse.setWorkload 'trot', 20
			trotInLetters = 'thirtyTwo'
			( => 	@horse.setWorkload 'trot', trotInLetters).should.throw "#{trotInLetters} is not a valid number"
			@horse.workload.trot.should.equal 20

