Router.map ->
  @route 'map',
    path: "/map"

    waitOn: -> [
      Meteor.subscribe "Tables"
    ]
    data: ->
      tables: Tables.find({},{sort:{idx:1}})

    action: ->
      @render()



Template.map.helpers
  rows: ->
    return [0..18]
  cols: ->
    return "ABCDEFGHIJKLMNOP".split("")
  # nextTable: ->
  #   t = tableNames.pop()
  #   console.log("t", t)
  #   t
  # tableName: (row, col) ->
  #   "T #{row} #{col}"