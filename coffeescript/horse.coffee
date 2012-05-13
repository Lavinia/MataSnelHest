class Horse
	constructor: ->
		@weight = null
	
	weight: ->
		@weight
	
	setWeight: (weight) ->
		convertedWeight = (Number) weight
		if isNaN convertedWeight 
			throw "#{weight} is not a number"
		@weight = convertedWeight
	
root = exports ? window
root.Horse = Horse