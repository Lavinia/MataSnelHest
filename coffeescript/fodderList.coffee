class FodderList
  constructor: ->
    @_nextId = -1

  append: (element) ->
    id = this.nextId()
    this[id] = element

  nextId: ->
    @_nextId = @_nextId + 1

  lastIndex: ->
    @_nextId

root = exports ? window
root.FodderList = FodderList
