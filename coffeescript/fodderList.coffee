class FodderList
  constructor: ->
    @_fodders = []
    @_nextId = -1

  append: (element) ->
    id = this.nextId()
    @_fodders[id] = element

  nextId: ->
    @_nextId = @_nextId + 1

  lastIndex: ->
    @_nextId

  getFodderByIndex: (index) ->
    @_fodders[index]

  calculateQuotient: (nutrient_nominator, nutrient_denominator) ->
    unless nutrient_nominator and nutrient_denominator
      ""
    else
      Math.round((nutrient_nominator / nutrient_denominator) * 10) / 10

  calculate: ->
    totals = { energy: 0, solids: 0, protein: 0, calcium: 0, phosphor: 0, magnesium: 0, selenium: 0 }

    for fodder in @_fodders
      solids_in_kilos = (fodder.solids / 100) * fodder.amount
      totals.solids += solids_in_kilos
      totals.energy += fodder.energy * fodder.amount
      totals.protein += fodder.protein * fodder.amount
      totals.calcium += fodder.calcium * fodder.amount
      totals.phosphor += fodder.phosphor * fodder.amount
      totals.magnesium += fodder.magnesium * fodder.amount
      totals.selenium += fodder.selenium * fodder.amount

    totals

  sufficentProteinEnergyQuotient: (nominator, denominator) ->
    if nominator / denominator >= 6 then true else false


root = exports ? window
root.FodderList = FodderList
