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

		it 'into account the workload', ->
			@horse.setWorkload 'daysPerWeek', 4, 'walk', 30, 'trot', 7
			@need.energyInMJ().should.equal 55.18

	describe 'calculate protein', ->
		it 'calculates the protein need in grams based on six times the energy need', ->
			@need.energyInMJ = -> 50
			@need.proteinInGrams().should.equal 300.00

		it 'shows the result with 2 numbers in precision', ->
			@horse.setGender 'stallion'
			@horse.setFeedType 'hard'
			@need.proteinInGrams().should.equal 354.66

	describe 'calculate calcium', ->
		it "calculates the calcium need in grams based on the horse's weight", ->
			ratios = [0.0, 0.29, 0.49, 0.50]
			expected = [18.00, 27.00, 31.50, 36.00]
			for i in [0...ratios.length]
				@need.workBaseEnergyRatio = -> ratios[i]
				@need.calciumInGrams().should.equal expected[i]

	it 'shows the result with 2 numbers in precision', ->
			@horse.setWeight 565.6
			@need.calciumInGrams().should.equal 22.62

	describe 'calculate phosphor', ->
		it "calculates the phosphor need in grams based on the horse's weight and workload", ->
			ratios = [0.0, 0.29, 0.49, 0.50]
			expected = [12.60, 16.20, 18.90, 26.10]
			for i in [0...ratios.length]
				@need.workBaseEnergyRatio = -> ratios[i]
				@need.phosphorInGrams().should.equal expected[i]

		it 'shows the result with 2 numbers in precision', ->
			@horse.setWeight 455
			@need.phosphorInGrams().should.equal 12.74

	describe 'calculate magnesium', ->
		it "calculates the magnesium need in grams based on the horse's weight and workload", ->
			ratios = [0.0, 0.29, 0.49, 0.50]
			expected = [6.75, 8.55, 10.35, 13.50]
			for i in [0...ratios.length]
				@need.workBaseEnergyRatio = -> ratios[i]
				@need.magnesiumInGrams().should.equal expected[i]

		it 'shows the result with 2 numbers in precision', ->
			@horse.setWeight 455
			@need.magnesiumInGrams().should.equal 6.82

	describe 'calculate selenium', ->
		it "calculates the selenium need in milligrams based on the horse's weight", ->
			@need.seleniumInMilligrams().should.equal 0.90

		it 'shows the result with 2 numbers in precision', ->
			@horse.setWeight 612
			@need.seleniumInMilligrams().should.equal 1.22

	describe 'calculate solids', ->
		it "calculates the solids in kilos based on the horse's weight", ->
			@need.solidsInKilos().should.equal 6.75

		it 'shows the result with 2 numbers in precision', ->
			@horse.setWeight 455
			@need.solidsInKilos().should.equal 6.82

	describe 'calculate salt', ->
		it "calculates the salt need in grams based on the horse's weight and workload", ->
			ratios = [0.0, 0.29, 0.49, 0.74, 1.3]
			expected = [22.95, 31.5, 40.5, 58.5, 94.5]
			for i in [0...ratios.length]
				@need.workBaseEnergyRatio = -> ratios[i]
				@need.saltInGrams().should.equal expected[i]

	describe 'calculate ratio of base need and work need', ->
		it 'calculates the ratio of the base need and work need', ->
			@need.baseEnergyInMJ = -> 56.00
			@need.workEnergyInMJ = -> 21.00
			@need.workBaseEnergyRatio().should.equal 21.00/56.00
			@need.baseEnergyInMJ = -> 62.00
			@need.workEnergyInMJ = -> 40.00
			@need.workBaseEnergyRatio().should.equal 40.00 / 62.00

	describe 'sufficient solids', ->
		it 'returns true when between 1 and 3 kg ts/100kg and day', ->
			@need.sufficientSolids(4.50).should.equal true
			@need.sufficientSolids(6.75).should.equal true
			@need.sufficientSolids(13.50).should.equal true
		it 'returns false when below xxx', ->
			@need.sufficientSolids(4.49).should.equal false
		it 'returns false when above max intake of solids', ->
			@need.sufficientSolids(13.51).should.equal false

	describe 'sufficent energy', ->
		beforeEach ->
			@need.baseEnergyInMJ = -> 50.00
			@need.workEnergyInMJ = -> 10.00

		it 'returns true when within +/-3 MJ of the energy need', ->
			@need.sufficentEnergy(57.00).should.equal true
			@need.sufficentEnergy(60.00).should.equal true
			@need.sufficentEnergy(63.00).should.equal true

		it 'returns false when beyond +/- 3 MJ of the energy need', ->
			@need.sufficentEnergy(56.99).should.equal false
			@need.sufficentEnergy(63.01).should.equal false

	describe 'sufficent protein', ->
		beforeEach ->
			@need.proteinInGrams = -> 50.00

		it 'returns true when within 10% of the protein need', ->
			@need.sufficentProtein(45.00).should.equal true
			@need.sufficentProtein(50.00).should.equal true
			@need.sufficentProtein(55.00).should.equal true

		it 'returns false when beyond 10% of the protein need', ->
			@need.sufficentProtein(44.99).should.equal false
			@need.sufficentProtein(55.01).should.equal false

	describe 'sufficient calcium', ->
		beforeEach ->
			@need.calciumInGrams = -> 24.00
		it 'returns true when above calcium need', ->
			@need.suffientCalcium(24.00).should.equal true
			@need.suffientCalcium(36.00).should.equal true
		it 'returns false when under the calcium need', ->
			@need.suffientCalcium(23.99).should.equal false
		it 'returns false when over 50% of calcuim need', ->
			@need.suffientCalcium(36.01).should.equal false

	describe 'sufficient phosphor', ->
		beforeEach ->
			@need.phosphorInGrams = -> 24.00
		it 'returns true when above phosphor need', ->
			@need.suffientPhosphor(24.00).should.equal true
			@need.suffientPhosphor(36.00).should.equal true
		it 'returns false when under the phosphor need', ->
			@need.suffientPhosphor(23.99).should.equal false
		it 'returns false when over 50% of phosphor need', ->
			@need.suffientPhosphor(36.01).should.equal false

	describe 'sufficient magnesium', ->
		beforeEach ->
			@need.magnesiumInGrams = -> 24.00
		it 'returns true when above magnesium need', ->
			@need.suffientMagnesium(24.00).should.equal true
			@need.suffientMagnesium(36.00).should.equal true
		it 'returns false when under the magnesium need', ->
			@need.suffientMagnesium(23.99).should.equal false
		it 'returns false when over 50% of magnesium need', ->
			@need.suffientMagnesium(36.01).should.equal false

	describe 'sufficient selenium', ->
		beforeEach ->
			@need.seleniumInMilligrams = -> 0.90 # horse weighing 450 kg
		it 'returns true when equal or above 5mg per 100kg weight', ->
			@need.sufficientSelenium(0.90).should.equal true
			@need.sufficientSelenium(22.50).should.equal true
		it 'returns false when over the max need', ->
			@need.sufficientSelenium(22.51).should.equal false
		it 'returns false when below the selenium need', ->
			@need.sufficientSelenium(0.89).should.equal false

	describe 'sufficient salt', ->
		beforeEach ->
			@need.saltInGrams = -> 22.4
		it 'returns true when above salt need', ->
			@need.sufficientSalt(22.4).should.equal true
		it 'returns false when below the salt need', ->
			@need.sufficientSalt(22.3).should.equal false







