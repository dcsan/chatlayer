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
          @response.writeHead(200, {'Content-Type': 'application/json'});
          console.log("rooms.api", blob)
          this.response.end(blob)

      # @route 'rooms'
      #   where: 'server',
      #   action: ->
      #     # // GET, POST, PUT, DELETE
      #     requestMethod = this.request.method;
      #     # // Data from a POST request
      #     requestData = this.request.body;
      #     # this.response.writeHead(200, {'Content-Type': 'text/html'});
      #     @response.end("test")
      #     # // Could be, e.g. application/xml, etc.
      #     # this.response.end('<html><body>Your request was a ' + requestMethod + '</body></html>');

  if Meteor.isClient

    Router.configure
      layoutTemplate: "ionicLayout"
      onRun: -> Trix.page()  # this should not be reactive but it seems to rerun X.X

    console.log("router")

    Router.map ->
      @route 'about'
