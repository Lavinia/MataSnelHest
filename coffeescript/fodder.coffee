class Fodder
  constructor: (options = {}) ->
    @name = options['name'] or ''
    @amount = options['amount'] or 0
    @solids = options['solids'] or 0
    @energy = options['energy'] or 0
    @protein = options['protein'] or 0
    @calcium = options['calcium'] or 0
    @phosphor = options['phosphor'] or 0
    @magnesium = options['magnesium'] or 0
    @selenium = options['selenium'] or 0

  setName: (name) ->
    @name = name

  setAmount: (amount) ->
    @amount = amount

  __is_valid_number: (converted, original) ->
    if isNaN converted
      throw "#{original} is not a valid number"

  setSolids: (solidsInPercent) ->
    convertedSolids = (Number) solidsInPercent
    @__is_valid_number(convertedSolids, solidsInPercent)
    @solids = convertedSolids

  setEnergy: (energy) ->
    convertedEnergy = (Number) energy
    @__is_valid_number(convertedEnergy, energy)
    @energy = convertedEnergy

  setProtein: (protein) ->
    convertedProtein = (Number) protein
    @__is_valid_number(convertedProtein, protein)
    @protein = protein

  setCalcium: (calcium) ->
    convertedCalcium = (Number) calcium
    @__is_valid_number(convertedCalcium, calcium)
    @calcium = calcium

  setPhosphor: (phosphor) ->
    convertedPhosphor = (Number) phosphor
    @__is_valid_number(convertedPhosphor, phosphor)
    @phosphor = phosphor

  setMagnesium: (magnesium) ->
    convertedMagnesium = (Number) magnesium
    @__is_valid_number(convertedMagnesium, magnesium)
    @magnesium = magnesium

  setSelenium: (selenium) ->
    convertedSelenium = (Number) selenium
    @__is_valid_number(convertedSelenium, selenium)
    @selenium = selenium

root = exports ? window
root.Fodder = Fodder
