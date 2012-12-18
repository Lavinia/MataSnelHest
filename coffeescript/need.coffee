class Need
	constructor: (horse) ->
		@horse = horse

	__round: (value) ->
		Math.round(value * 100) / 100

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

	__maxSeleniumNeed: ->
		@__horseWeightInDeciton() * 5

	__minProteinNeed: ->
		0.9 * this.proteinInGrams()

	__maxProteinNeed: ->
		1.1 * this.proteinInGrams()

	__minEnergyNeed: ->
		this.energyInMJ() - 3

	__maxEnergyNeed: ->
		this.energyInMJ() + 3

	__horseWeightInDeciton: ->
		@horse.weight / 100

	__maxSolids: ->
		@__horseWeightInDeciton() * 3.00

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

	workBaseEnergyRatio: ->
		@workEnergyInMJ() / @baseEnergyInMJ()

	energyInMJ: ->
		@__round(@baseEnergyInMJ() + @workEnergyInMJ())

	proteinInGrams: ->
		@__round @energyInMJ() * 6

	calciumInGrams: ->
		@__round @__horseWeightInDeciton() * @__macroMineralNeed([4.0, 6.0, 7.0, 8.0, 8.0])

	phosphorInGrams: ->
		@__round @__horseWeightInDeciton() * @__macroMineralNeed([2.8, 3.6, 4.2, 5.8, 5.8])

	magnesiumInGrams: ->
		@__round @__horseWeightInDeciton() * @__macroMineralNeed([1.5, 1.9, 2.3, 3.0, 3.0])

	seleniumInMilligrams: ->
		@__round @__horseWeightInDeciton() * 0.2

	solidsInKilos: ->
		@__round @__horseWeightInDeciton() * 1.5

	saltInGrams: ->
		@__horseWeightInDeciton() * @__macroMineralNeed([5.1, 7, 9, 13, 21])

	sufficientSolids: (solids) ->
		@__horseWeightInDeciton() <= solids <= @__maxSolids()

	sufficentEnergy: (energy) ->
		@__minEnergyNeed() <= energy <= @__maxEnergyNeed()

	sufficentProtein: (protein) ->
		@__minProteinNeed() <= protein <= @__maxProteinNeed()

	suffientCalcium: (calcium) ->
		@__sufficientMacroMineral(calcium, this.calciumInGrams())

	suffientPhosphor: (phosphor) ->
		@__sufficientMacroMineral(phosphor, this.phosphorInGrams())

	suffientMagnesium: (magnesium) ->
		@__sufficientMacroMineral(magnesium, this.magnesiumInGrams())

	sufficientSelenium: (selenium) ->
		this.seleniumInMilligrams() <= selenium <= @__maxSeleniumNeed()

	sufficientSalt: (salt) ->
		@__sufficientMacroMineral(salt, this.saltInGrams())

root = exports ? window
root.Need = Need
