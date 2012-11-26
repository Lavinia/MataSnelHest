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
      throw new Error "#{weight} is not a valid number"
    else if convertedWeight < 0
      throw new Error "#{weight} is not a valid weight"
    @weight = convertedWeight

  setGender: (gender) ->
    unless gender in genders
      throw new Error "#{gender} is not a valid horse gender"
    @gender = gender

  setFeedType: (feedType) ->
    unless feedType in feedTypes
      throw new Error "#{feedType} is not a valid horse feed type"
    @feedType = feedType

  setWorkload: (args...) ->
    for i in [0...args.length] by 2
      if (isNaN args[i + 1]) or args[i + 1] < 0
        throw new Error "#{args[i + 1]} is not a valid number"
      else
        @workload[args[i]] = args[i + 1]

root = exports ? window
root.Horse = Horse
