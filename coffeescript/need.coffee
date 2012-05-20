class Need
	constructor: (horse) ->
		@horse = horse
	
	__round: (value) ->
		Math.round(value * 100) / 100	
	
	energy: ->
		feedTypeFactor = 1.00
		switch @horse.feedType
			when 'normal' then feedTypeFactor = 1.05
			when 'hard' then feedTypeFactor = 1.10
		
		@__round(0.5 * Math.pow(@horse.weight, 0.75) * feedTypeFactor)

	
root = exports ? window
root.Need = Need
