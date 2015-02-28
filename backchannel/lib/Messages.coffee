@Messages = new Meteor.Collection("Messages")

Meteor.startup ->
  if Meteor.isServer
    Messages.remove({})


# data = [
#   {t: "hi whats up"}
#   {t: "not much you?"}
# ]