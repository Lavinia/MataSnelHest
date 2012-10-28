class Fodder
  constructor: ->
    @name = null
    @amount = null
    @solids = null
    @energy = null

  setName: (name) ->
    @name = name

  setAmount: (amount) ->
    @amount = amount

  setSolids: (solidsInPercent) ->
    @solids = solidsInPercent

  setEnergy: (energy) ->
    @energy = energy


root = exports ? window
root.Fodder = Fodder