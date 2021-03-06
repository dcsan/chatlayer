@Tables = new Meteor.Collection("Tables")

tableNames = []
loadTableData = () ->
  t = Tables.find().count()
  if t != 0
    return   # dont nuke the data!
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
    loadTableData()

    Meteor.publish 'Tables', (query) ->
      query ?= {}
      res = Tables.find(query)
      console.log("Tables", res.count() )
      res


Tables.addUser = (card) ->
  # debugger
  console.log("addUser", card)
  tableName = card.table.toUpperCase()
  avatarImg = "https://avatars0.githubusercontent.com/u/#{card.user}"
  table = Tables.findOne({
    name: tableName
  })
  avatars = table.avatars or []
  avatars.push(avatarImg)
  avatars = avatars.slice(-3)

  update = {$set: {avatars: avatars}}
  Tables.update(
    {_id: table._id},
    update
  )
  console.log("updated table", table, "to", update)
