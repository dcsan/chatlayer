@Map = {}

NUM_BUBBLES = 30

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

randomPos = (rx, ry) ->
  x = dclib.randomRange(0, rx)
  y = dclib.randomRange(0, ry)
  pos = "top: #{y}px; left: #{x}px;"
  # console.log("pos", pos)
  return pos

# data = new ReactiveVar()
Template.map.rendered = ->
  tables = Tables.find({},{sort:{idx:1}})

  # first redraw after data loaded, GH login
  setTimeout () =>
      Map.redraw()
  , 2000

  setInterval () =>
      Map.redraw()
  , 30000


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
    randomPos(10,5)

  bubbles: () ->
    getBubbles()

  # nextTable: ->
  #   t = tableNames.pop()
  #   console.log("t", t)
  #   t
  # tableName: (row, col) ->
  #   "T #{row} #{col}"

getBubbles = () ->
  bubbles = Requests.find(
    {}, 
    {sort: {"time": -1}, limit: NUM_BUBBLES},
  )
  console.log("bubbles count:", bubbles.count())
  console.log("bubbles:", bubbles.fetch() )
  bubs = bubbles.fetch().reverse()
  return bubs

addBubble = (inputData) ->
  txt = inputData.request
  # TODO - bump avatar
  return unless txt
  tableName = inputData.table.toUpperCase()
  jitter = randomPos(3,3)
  bub = "<div id='bub' class='animated bounceIn bub' style='#{jitter}'>#{txt}</div>"
  $("#" + tableName).append(bub)
  console.log("tableName", tableName, txt)

drawBubbles = () ->
  console.log("drawBubbles")
  bubbles = getBubbles()
  $(".bub").remove()
  for bub in bubbles
    console.log("drawBub", bub)
    addBubble(bub)

Map.redraw = () ->
  drawBubbles()

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
