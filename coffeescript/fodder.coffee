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

  __isValidNumber: (original) ->
    asNum = (Number) original.replace(',', '.')
    if isNaN asNum
      throw new Error "#{original} is not a valid number"
    else
      asNum

  setSolids: (solidsString) ->
    @solids = @__isValidNumber solidsString

  setEnergy: (energyString) ->
    @energy =  @__isValidNumber energyString

  setProtein: (proteinString) ->
    @protein = @__isValidNumber proteinString

  setCalcium: (calciumString) ->
    @calcium = @__isValidNumber calciumString

  setPhosphor: (phosphorString) ->
    @phosphor = @__isValidNumber phosphorString

  setMagnesium: (magnesiumString) ->
    @magnesium = @__isValidNumber magnesiumString

  setSelenium: (seleniumString) ->
    @selenium =@__isValidNumber seleniumString

root = exports ? window
root.Fodder = Fodder
