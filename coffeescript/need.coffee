class Need
	constructor: (horse) ->
		@horse = horse
	
	__round: (value) ->
		Math.round(value * 100) / 100	
	
	workEnergyInMJ: ->
		walkEnergy = (@horse.workload['walk'] / 10) * 0.2 * (@horse.weight / 100)
		trotEnergy = (@horse.workload['trot'] / 10) * 1.3 * (@horse.weight / 100)
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
	
	__macroMineralNeed: (mineralNeeds) ->
		ratio = @workBaseEnergyRatio()
		if ratio is 0
			factor = mineralNeeds[0]
		else if ratio < 0.30
			factor = mineralNeeds[1]
		else if ratio < 0.50
			factor = mineralNeeds[2]
		else
			factor = mineralNeeds[3]
	
	calciumInGrams: ->
		@__round (@horse.weight / 100) * @__macroMineralNeed([4.0, 6.0, 7.0, 8.0])
	
	phosphorInGrams: ->
		@__round (@horse.weight / 100) * @__macroMineralNeed([2.8, 3.6, 4.2, 5.8])
	
	magnesiumInGrams: ->
		@__round (@horse.weight / 100) * @__macroMineralNeed([1.5, 1.9, 2.3, 3.0])
	
	seleniumInMilligrams: ->
		@__round (@horse.weight / 100) * 0.2
	
	solidsInKilos: ->
		@__round (@horse.weight / 100) * 1.5
	
root = exports ? window
root.Need = Need
