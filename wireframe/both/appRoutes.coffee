Meteor.startup ->

  if Meteor.isServer

    Router.map ->

      @route "rooms",
        where: "server",
        path: "/rooms.api"

        # waitOn: -> [
        #   Meteor.subscribe "feedback", yes
        # ]
        action: ->
          room = Rooms.findOne({})
          blob = JSON.stringify(room)
          @response.writeHead(200, {'Content-Type': 'application/json'})
          console.log("rooms.api", blob)
          this.response.end(blob)

  if Meteor.isClient

    Router.configure
      layoutTemplate: "ionicLayout"
      # onRun: -> Trix.page()  # this should not be reactive but it seems to rerun X.X

    console.log("router")

    Router.map ->
      @route 'about'
      @route 'profiles'
      @route 'stream'
