class Need
	constructor: (horse) ->
		@horse = horse
	
	__round: (value) ->
		Math.round(value * 100) / 100	
	
	energyInMJ: ->
		feedTypeFactor = genderFactor = 1.00
		switch @horse.feedType
			when 'normal' then feedTypeFactor = 1.05
			when 'hard' then feedTypeFactor = 1.10
		if @horse.gender is 'stallion' then genderFactor = 1.10
		@__round(0.5 * Math.pow(@horse.weight, 0.75) * feedTypeFactor * genderFactor)
		
	proteinInGrams: ->
		@__round @energyInMJ() * 6
	
	calciumInGrams: ->
		@__round (@horse.weight / 100.0) * 4.0
	
	phosphorInGrams: ->
		@__round (@horse.weight / 100) * 2.8	
	
	magnesiumInGrams: ->
		@__round (@horse.weight / 100) * 1.5
	
	seleniumInMilligrams: ->
		@__round (@horse.weight / 100) * 0.2
	
	solidsInKilos: ->
		@__round (@horse.weight / 100) * 1.5

root = exports ? window
root.Need = Need
