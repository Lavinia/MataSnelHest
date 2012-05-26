class Horse
	genders = ['mare', 'stallion', 'gelding']
	feedTypes = ['hard', 'normal', 'easy']
	
	constructor: ->
		@weight = null
		@gender = null
		@feedType = 'normal'
		@workload = { 
			daysPerWeek: 0
			walk: 0
			trot: 0 
		}
	
	setWeight: (weight) ->
		convertedWeight = (Number) weight
		if isNaN convertedWeight 
			throw "#{weight} is not a valid number"
		@weight = convertedWeight
	
	setGender: (gender) ->
		unless gender in genders
			throw "#{gender} is not a valid horse gender"
		@gender = gender
	
	setFeedType: (feedType) ->
		unless feedType in feedTypes
			throw "#{feedType} is not a valid horse feed type"
		@feedType = feedType
	
	setWorkload: (args...) ->
		for i in [0...args.length] by 2
			@workload[args[i]] = args[i + 1]
	
root = exports ? window
root.Horse = Horse