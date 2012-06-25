class Fodder
  constructor: ->
    @name = null
    @solids = null
    @energy = null
    
  setName: (name) ->
    @name = name

  setSolids: (solidsInPercent) ->
    @solids = solidsInPercent

  setEnergy: (energy) ->
    @energy = energy


root = exports ? window
root.Fodder = Fodder