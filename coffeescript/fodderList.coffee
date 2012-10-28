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

  calculate: ->
    totals = { energy: 0, solids: 0, protein: 0, calcium: 0, phosphor: 0, magnesium: 0, selenium: 0 }

    for fodder in @_fodders
      totals.solids += fodder.solids * fodder.amount
      totals.energy += fodder.energy * fodder.amount
      totals.protein += fodder.protein * fodder.amount
      totals.calcium += fodder.calcium * fodder.amount
      totals.phosphor += fodder.phosphor * fodder.amount
      totals.magnesium += fodder.magnesium * fodder.amount
      totals.selenium += fodder.selenium * fodder.amount

    totals

root = exports ? window
root.FodderList = FodderList
