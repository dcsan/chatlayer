Template.chatroom.events 'submit': (e, t) ->

  e.preventDefault()
  text = $('#textarea').val()
  table = $('#table').val()
  user = Meteor.user().profile.name
  id = Meteor.user().services.github.id
  user = Meteor.user().services.github.username

  # if (text === "") {
  #   alert("Please enter your request")
  #   return
  # }
  #
  if table == ''
    alert 'Please enter your table'
    return

  data =
    'user': id
    'name': user
    'table': table
    'request': text
    'username': user
    'time': new Date
  Requests.insert data
  Map.redraw()
  Tables.addUser data
  $('#textarea').val ''
  console.log 'added', data
  return


Template.chatroom.helpers msg: ->
  Messages.find {}, sort: time: -1

