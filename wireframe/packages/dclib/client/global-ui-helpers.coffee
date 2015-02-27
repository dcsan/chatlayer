UI.registerHelper "someid", () ->
  return Date.now()
  # return Meteor.uuid()
  # return Math.round(Math.random() * 1000000)

UI.registerHelper "timestamp", () ->
  return Date.now()

UI.registerHelper "clog", (obj, msg) ->
  msg ?= ""
  console.log(obj, msg)


UI.registerHelper "hl", (txt) ->
  return txt

UI.registerHelper "tl", (txt) ->
  return txt

UI.registerHelper "setTitle", ->
  dclib.setTitle(arguments)
  return ""