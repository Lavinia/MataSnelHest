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
	
	calciumInGrams: ->
		ratio = @workBaseEnergyRatio()
		if ratio is 0
			calciumFactor = 4.0
		else if ratio < 0.30
			calciumFactor = 6.0
		else if ratio < 0.50
			calciumFactor = 7.0
		else
			calciumFactor =  8.0
		@__round (@horse.weight / 100) * calciumFactor
	
	phosphorInGrams: ->
		ratio = @workBaseEnergyRatio()
		if ratio is 0
			phosphorFactor = 2.8
		else if ratio < 0.30
			phosphorFactor = 3.6
		else if ratio < 0.50
			phosphorFactor = 4.2
		else
			phosphorFactor =  5.8
		@__round (@horse.weight / 100) * phosphorFactor
	
	magnesiumInGrams: ->
		ratio = @workBaseEnergyRatio()
		if ratio is 0
			magnesiumFactor = 1.5
		else if ratio < 0.30
			magnesiumFactor = 1.9
		else if ratio < 0.50
			magnesiumFactor = 2.3
		else
			magnesiumFactor =  3.0
		@__round (@horse.weight / 100) * magnesiumFactor
	
	seleniumInMilligrams: ->
		@__round (@horse.weight / 100) * 0.2
	
	solidsInKilos: ->
		@__round (@horse.weight / 100) * 1.5
	
root = exports ? window
root.Need = Need
