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

  __isValidNumber: (converted, original) ->
    if isNaN converted
      throw new Error "#{original} is not a valid number"

  __stringToNum: (string) ->
    (Number) string

  __replaceCommas: (string) ->
    string.replace(',','.')

  setSolids: (solidsString) ->
    solidsInPercent = solidsString.replace(',','.')
    convertedSolids = (Number) solidsInPercent
    @__isValidNumber(convertedSolids, solidsInPercent)
    @solids = convertedSolids

  setEnergy: (energyString) ->
    energy = @__replaceCommas(energyString)
    @__isValidNumber(@__stringToNum(energy), energy)
    @energy = @__stringToNum(energy)

  setProtein: (proteinString) ->
    protein = proteinString.replace(',','.')
    convertedProtein = (Number) protein
    @__isValidNumber(convertedProtein, protein)
    @protein = convertedProtein

  setCalcium: (calciumString) ->
    calcium = calciumString.replace(',','.')
    convertedCalcium = (Number) calcium
    @__isValidNumber(convertedCalcium, calcium)
    @calcium = convertedCalcium

  setPhosphor: (phosphorString) ->
    phosphor = phosphorString.replace(',','.')
    convertedPhosphor = (Number) phosphor
    @__isValidNumber(convertedPhosphor, phosphor)
    @phosphor = convertedPhosphor

  setMagnesium: (magnesiumString) ->
    magnesium = magnesiumString.replace(',','.')
    convertedMagnesium = (Number) magnesium
    @__isValidNumber(convertedMagnesium, magnesium)
    @magnesium = convertedMagnesium

  setSelenium: (seleniumString) ->
    selenium = seleniumString.replace(',','.')
    convertedSelenium = (Number) selenium
    @__isValidNumber(convertedSelenium, selenium)
    @selenium = convertedSelenium

root = exports ? window
root.Fodder = Fodder
