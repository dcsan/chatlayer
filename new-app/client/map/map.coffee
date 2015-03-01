@Map = {}

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

# data = new ReactiveVar()
Template.map.rendered = ->
  tables = Tables.find({},{sort:{idx:1}})
  # data.set(tables)


Template.map.helpers
  nums: ->
    AppConfig.nums
  alphas: ->
    AppConfig.alphas
    
  tables: ->
    Tables.find({},{sort:{idx:1}})

  lastAvatar: (table) ->
    src = table.avatars.pop()
    if src
      return src
    else
      return "/anon.png"

  randomPos: () ->
    x = dclib.randomRange(0, 60)
    y = dclib.randomRange(0, 20)
    pos = "top: #{y}px; left: #{x}px;"
    console.log("pos", pos)
    return pos

  # nextTable: ->
  #   t = tableNames.pop()
  #   console.log("t", t)
  #   t
  # tableName: (row, col) ->
  #   "T #{row} #{col}"

Map.addBubble = (inputData) ->
  txt = inputData.request
  # TODO - bump avatar
  return unless txt
  tableName = inputData.table.toUpperCase()
  bub = "<div id='bub' class='animated bounceIn bub'>#{txt}</div>"
  $("#" + tableName).append(bub)
  console.log("tableName", tableName, txt)


Template.map.events
  'click .avatar': (evt) ->
    username = console.log(evt.target.username)

  'click .oneTable': (evt) ->
    tableName = $(evt.target).data("tableName")
    console.log(tableName)
    $("#inputField").text = "hey table #{tableName}!"
    # TODO - enter your tables project

  'click .bub': (evt) ->
    $(evt.target).remove()
