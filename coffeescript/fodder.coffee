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

  setSolids: (solidsInPercent) ->
    @solids = solidsInPercent

  setEnergy: (energy) ->
    @energy = energy

  setProtein: (protein) ->
    @protein = protein

  setCalcium: (calcium) ->
    @calcium = calcium

  setPhosphor: (phosphor) ->
    @phosphor = phosphor

  setMagnesium: (magnesium) ->
    @magnesium = magnesium

  setSelenium: (selenium) ->
    @selenium = selenium

root = exports ? window
root.Fodder = Fodder