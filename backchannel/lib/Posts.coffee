@Posts = new Meteor.Collection("Posts")

Meteor.startup ->
  if Meteor.isServer
    Posts.remove({})


# data = [
#   {t: "hi whats up"}
#   {t: "not much you?"}
# ]