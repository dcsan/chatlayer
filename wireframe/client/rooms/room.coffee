Router.map ->
  @route 'room',
    path: "/room/:cname"

    waitOn: -> [
      Meteor.subscribe "Rooms", {cname: @params.cname}
    ]
    data: ->
      room: Rooms.findOne({cname: @params.cname})

    action: ->
      @render()
