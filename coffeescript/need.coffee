class Need
	constructor: (horse) ->
		@horse = horse

	solidsInKilos: ->
		@__round @__horseWeightInDeciton() * 1.5

	sufficientSolids: (solids) ->
		@__horseWeightInDeciton() <= solids <= @__maxSolids()

	energyInMJ: ->
		@__round @baseEnergyInMJ() + @workEnergyInMJ()

	workBaseEnergyRatio: ->
		@workEnergyInMJ() / @baseEnergyInMJ()

	workEnergyInMJ: ->
		walkEnergy = (@horse.workload['walk'] / 10) * 0.2 * @__horseWeightInDeciton()
		trotEnergy = (@horse.workload['trot'] / 10) * 1.3 * @__horseWeightInDeciton()
		(walkEnergy + trotEnergy) * (@horse.workload['daysPerWeek'] / 7)

	baseEnergyInMJ: ->
		feedTypeFactor = genderFactor = 1.00
		switch @horse.feedType
			when 'normal' then feedTypeFactor = 1.05
			when 'hard' then feedTypeFactor = 1.10
		if @horse.gender is 'stallion' then genderFactor = 1.10
		0.5 * Math.pow(@horse.weight, 0.75) * feedTypeFactor * genderFactor

	sufficentEnergy: (energy) ->
		@__minEnergyNeed() <= energy <= @__maxEnergyNeed()

	proteinInGrams: ->
		@__round @energyInMJ() * 6

	sufficentProtein: (protein) ->
		@__minProteinNeed() <= protein <= @__maxProteinNeed()

	calciumInGrams: ->
		@__round @__horseWeightInDeciton() * @__macroMineralNeed([4.0, 6.0, 7.0, 8.0, 8.0])

	suffientCalcium: (calcium) ->
		@__sufficientMacroMineral(calcium, this.calciumInGrams())

	phosphorInGrams: ->
		@__round @__horseWeightInDeciton() * @__macroMineralNeed([2.8, 3.6, 4.2, 5.8, 5.8])

	suffientPhosphor: (phosphor) ->
		@__sufficientMacroMineral(phosphor, this.phosphorInGrams())

	magnesiumInGrams: ->
		@__round @__horseWeightInDeciton() * @__macroMineralNeed([1.5, 1.9, 2.3, 3.0, 3.0])

	suffientMagnesium: (magnesium) ->
		@__sufficientMacroMineral(magnesium, this.magnesiumInGrams())

	seleniumInMilligrams: ->
		@__round @__horseWeightInDeciton() * 0.2

	sufficientSelenium: (selenium) ->
		this.seleniumInMilligrams() <= selenium <= @__maxSeleniumNeed()

	saltInGrams: ->
		@__horseWeightInDeciton() * @__macroMineralNeed([5.1, 7, 9, 13, 21])

	sufficientSalt: (salt) ->
		@__sufficientMacroMineral(salt, this.saltInGrams())

	__maxSolids: ->
		@__horseWeightInDeciton() * 3.00

	__minEnergyNeed: ->
		this.energyInMJ() - 3

	__maxEnergyNeed: ->
		this.energyInMJ() + 3

	__macroMineralNeed: (mineralNeeds) ->
		ratio = @workBaseEnergyRatio()
		if ratio is 0
			factor = mineralNeeds[0]
		else if ratio < 0.30
			factor = mineralNeeds[1]
		else if ratio < 0.50
			factor = mineralNeeds[2]
		else if ratio < 0.75
			factor = mineralNeeds[3]
		else
			factor = mineralNeeds[4]

	__sufficientMacroMineral: (mineral, mineral_need) ->
		mineral_need <= mineral <= (1.5 * mineral_need)

	__minProteinNeed: ->
		0.9 * this.proteinInGrams()

	__maxProteinNeed: ->
		1.1 * this.proteinInGrams()

	__maxSeleniumNeed: ->
		@__horseWeightInDeciton() * 5

	__round: (value) ->
		Math.round(value * 100) / 100

	__horseWeightInDeciton: ->
		@horse.weight / 100

root = exports ? window
root.Need = Need
