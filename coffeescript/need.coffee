class Need
	constructor: (horse) ->
		@horse = horse
	
	__round: (value) ->
		Math.round(value * 100) / 100	
	
	energy: ->
		feedTypeFactor = genderFactor = 1.00
		switch @horse.feedType
			when 'normal' then feedTypeFactor = 1.05
			when 'hard' then feedTypeFactor = 1.10
		if @horse.gender is 'stallion' then genderFactor = 1.10
		@__round(0.5 * Math.pow(@horse.weight, 0.75) * feedTypeFactor * genderFactor)
		
	protein: ->
		@energy() * 6
	
	calcium: ->
		(@horse.weight / 100.0) * 4.0
	
	phosphor: ->
		(@horse.weight / 100) * 2.8	
	
	magnesium: ->
		(@horse.weight / 100) * 1.5
	
	selenium: ->
		(@horse.weight / 100) * 0.2
root = exports ? window
root.Need = Need
