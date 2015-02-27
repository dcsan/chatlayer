@Rooms = new Meteor.Collection("Rooms")

roomData = [

  {
    name: "alpha"
    members: ["bob", "annie", "jane"]
  }
  {
    name: "beta"
    members: ["punk", "sam", "blobby"]
  }

]

Meteor.startup ->

  if Meteor.isServer

    Rooms.remove({})
    for room in roomData
      room.cname ?= room.name
      room.href ?= "/room/#{room.cname}"
      Rooms.insert(room)

    Meteor.publish 'Rooms', (query) ->
      query ?= {}
      res = Rooms.find(query)
      console.log("Rooms", res.count() )
      res
