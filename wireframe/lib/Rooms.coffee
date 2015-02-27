@Rooms = new Meteor.Collection("Rooms")

roomData = [

  {name: "alpha"}
  {name: "beta"}

]

Meteor.startup ->

  if Meteor.isServer

    Rooms.remove({})
    for room in roomData
      Rooms.insert(room)
