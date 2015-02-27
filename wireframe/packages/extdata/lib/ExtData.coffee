ExtData = {}

ExtData.readAirtable = () ->
  console.log("init airtable")
  Airtable = Meteor.npmRequire('Airtable')
  Airtable.configure({ apiKey: 'keyZxed55akTIHEbA' })

  app = Airtable.app('app17f4cc2c975940')

  app('grammar').list 3, 0, (err, records, newOffset) ->
    if err
      console.log err
      return
    else
      console.log('grammar', JSON.stringify(records, null, 2))

# TODO - extract nested fields like ex.en, ex.ja
explodeRow = (row) ->
  cleanData = []

  for field, val of row
    console.log "field", field, val
    [f1, f2] = field.split(".")
    console.log("f1, f2", f1, f2)
    if f2
      obj = row[f1] or {}   # ja: 'bo'
      obj[f2] = val
      row[f1] = obj
      console.log('special field', field, obj)
    else
      console.log("basic field", field)
    console.log("add row", row)
    cleanData.push[row]

  console.log("cleanData:", cleanData)
  return cleanData

doneCB = (err, res) ->
  console.log("dummy CB")

ExtData.readSheet = (opts) ->
  console.log('============ options ', opts)

  GoogleSpreadsheet = Meteor.npmRequire("google-spreadsheet")
  opts.key ?= Meteor.settings.metaDataSheetKey
  console.log("readSheet", opts)
  sheet = new GoogleSpreadsheet(opts.key)

  data = Async.runSync((doneCB) ->
    sheet.getRows opts.worksheet, (err, res) ->
      # console.log("runSync calling doneCB", doneCB)
      console.log( 'pulled in '+ res.length + ' rows ')
      doneCB(err, res)
  )

  for row in data.result
    junk = ['_xml', '_links', 'id', 'save', 'del', 'content']
    for fname in junk
      delete row[fname]
  return data.result


##TODO - consider using JSON feed
# still needs parsing
# and gets returned as JSONP
# example response:
#   https://docs.google.com/spreadsheets/d/1IDunPHmj9t5RSvzCbMb0sR4Dn1uIidptUAo4vyvyqGQ/gviz/tq
# DOCS
#   https://developers.google.com/chart/interactive/docs/querylanguage

ExtData.readSheetAsJsonP = (sheetKey) ->

  url="https://docs.google.com/spreadsheets/d/"+sheetKey+"/gviz/tq"
  console.log('url', url)

  # http = require('https');

  http.get(url, (res) ->
    body = ''
    res.on 'data', (chunk) ->
      body += chunk
      return
    res.on 'end', ->
      console.log 'body', body
      fbResponse = JSON.parse(body)
      console.log 'Got response: ', fbResponse.picture
      return
    return
  ).on 'error', (e) ->
    console.log 'Got error: ', e
    return


ExtData.readSheetJson = (opts) ->
  url = "https://spreadsheets.google.com/feeds/worksheets/1IDunPHmj9t5RSvzCbMb0sR4Dn1uIidptUAo4vyvyqGQ/public/basic?alt=json"
  res = HTTP.get(url)
  console.log(res.content)
  content = JSON.parse(res.content)
  console.log("content", content)
  console.log("entry", res.data.feed.entry )
  

# Meteor.startup ->
#   ExtData.readSheetJson()

ExtData.parseYamlString = (data) ->
  data = YAML.safeLoad(data)
  console.log('yaml>', data)
  return data


ExtData.splitSlashed = (row) ->
  cards = []
  rawCards = row.split("/")
  for card in rawCards
    card = card.trim()
    if card.length > 0
      cards.push(card)
  row.cards = cards
  cards
