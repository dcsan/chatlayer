if Meteor.isClient
  Router.map ->
    @route "index",
      path: "/"

    @route "/home",
      action: -> @render "index"


# hide URL bar
Template.index.rendered = ->
  dclib.hideUrlBar()
  dclib.setTitle("home")
