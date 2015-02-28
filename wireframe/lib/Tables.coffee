@Tables = new Meteor.Collection("Tables")

tableNames = []
addTableData = () ->
  Tables.remove({})
  az = "ABCDEFGHIJKLMNOP".split("")
  idx = 1  # index from 1
  for row in [1..18]
    for letter in az
      table = {
        name: "#{letter}#{row}"
        row: row
        letter: letter
        idx: idx
      }
      if letter=="P"
        table.endcap = true
      Tables.insert(table)
      idx++


Meteor.startup ->

  if Meteor.isServer
    addTableData()
    

    Meteor.publish 'Tables', (query) ->
      query ?= {}
      res = Tables.find(query)
      console.log("Tables", res.count() )
      res
