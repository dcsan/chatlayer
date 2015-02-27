Router.map ->
  @route 'roomList',
    path: "/roomList/"

    waitOn: -> [
      Meteor.subscribe "Rooms"
    ]
    data: ->
      rooms: Rooms.find()

    action: ->
      @render()
