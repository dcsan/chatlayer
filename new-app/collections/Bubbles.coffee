# @Bubbles = new Meteor.Collection("Bubbles")

# Meteor.startup ->

#   if Meteor.isServer
#     # loadTableData()

#     Meteor.publish 'Bubbles', (query) ->
#       query ?= {}
#       res = Bubbles.find(query)
#       console.log("Bubbles", res.count() )
#       res

#     