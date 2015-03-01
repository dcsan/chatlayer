# Router.map ->
#   @route 'map',
#     path: "/map"

#     waitOn: -> [
#       Meteor.subscribe "Tables"
#     ]
#     data: ->
#       tables: Tables.find({},{sort:{idx:1}})

#     action: ->
#       @render()



quotes = [
  "I need some help with CSSI need some help with CSSI need some help with CSSI need some help with CSS"
  # "looking for a ..."
   "Looking for testers!"
  # "Looking for testers!"
  # "Anyone down to spoon?"
]

data = new ReactiveVar()
Template.map.rendered = ->
  tables = Tables.find({},{sort:{idx:1}})
  data.set(tables)


Template.map.helpers
  nums: ->
    AppConfig.nums
  alphas: ->
    AppConfig.alphas
    
  tables: ->
    Tables.find({},{sort:{idx:1}})

  # nextTable: ->
  #   t = tableNames.pop()
  #   console.log("t", t)
  #   t
  # tableName: (row, col) ->
  #   "T #{row} #{col}"


Template.map.events
  'click .oneTable': (evt) ->
    txt = _.shuffle(quotes)[0]
    bub = "<div id='bub' class='animated bounceIn bub'>#{txt}</div>"
    $(evt.target).append(bub)
