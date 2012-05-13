class Horse
	genders = ['mare', 'stallion', 'gelding']
	
	constructor: ->
		@weight = null
		@gender = null
	
	setWeight: (weight) ->
		convertedWeight = (Number) weight
		if isNaN convertedWeight 
			throw "#{weight} is not a number"
		@weight = convertedWeight
	
	setGender: (gender) ->
		unless gender in genders
			throw "#{gender} is not a horse gender"
		@gender = gender
	

root = exports ? window
root.Horse = Horse