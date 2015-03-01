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


quotes = [
  "I need some help with CSS"
  "looking for a ..."
  "Looking for testers!"
  "Looking for testers!"
  "Anyone down to spoon?"
]


Template.map.helpers
  rows: ->
    return [0..18]
  cols: ->
    return "ABCDEFGH".split("")
  # nextTable: ->
  #   t = tableNames.pop()
  #   console.log("t", t)
  #   t
  # tableName: (row, col) ->
  #   "T #{row} #{col}"


Template.map.events
  'click .oneTable': (evt) ->
    bub = "<div id='bub' class='bub'>Hi!</div>"
    $(evt.target).append(bub)
