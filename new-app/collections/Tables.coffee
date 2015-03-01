@Tables = new Meteor.Collection("Tables")

tableNames = []
addTableData = () ->
  Tables.remove({})
  alphas = AppConfig.alphas
  nums = AppConfig.nums
  idx = 1  # index from 1
  for letter in alphas
    for num in nums
      name = "#{num}#{letter}"
      table = {
        name: name
        num: num
        letter: letter
        idx: idx
      }
      if num==1
        table.endcap = true
      if name=="1F" or name=="1L"
        table.vspace = true
      if num % 2 == 1
        table.spacer = true

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


Tables.addUser = (card) ->
  # debugger
  avatarImg = "https://avatars0.githubusercontent.com/u/#{card.user}"
  table = Tables.findOne({
    name: card.table
  })
  avatars = table.avatars or []
  avatars.push(avatarImg)
  update = {$set: {avatars: avatars}}
  Tables.update(
    {_id: table._id},
    update
  )
  console.log("updated table", table, "to", update)
