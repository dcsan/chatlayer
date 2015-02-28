Widgets = new Meteor.Collection("Widgets")

if Meteor.isClient
  Meteor.startup ->
    console.log("create widgets")
