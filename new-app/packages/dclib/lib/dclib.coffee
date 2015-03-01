dclib = {}

dclib.sessGet = (k) ->
  return Session.get(k)

dclib.randomRange = (x,y) ->
  Math.floor(Math.random() * ((y-x)+1) + x);


dclib.clog = (group, msg, obj) ->
  obj ?= ""
  console.log(group, msg, obj)


# hide a widget which has a uuid
dclib.hideMe = (obj) ->
  uuid = obj.uuid
  unless obj
    console.warn("hideMe cant find a uuid in:", obj)
    return
  $("#" + uuid).hide()

dclib.hideUrlBar = ->
  window.scrollTo(0,1)

dclib.setTitle = ->
  title = "ComicEnglish | "
  for arg in arguments
    title += arg
  document.title = title


# Trix related

# Router.onRun is not meant to be called reactively,
# but it is, so we de-dupe calls here
lastPath = null
dclib.isNewPath = (thisPath) ->
  thisPath = dclib.getCurrentPath()
  return false unless thisPath
  if thisPath == lastPath
    # console.log("isNewPath:false", thisPath)
    return false
  else
    # console.log("isNewPath:true", thisPath)
    lastPath = thisPath
    return true

dclib.getCurrentPath = () ->
  @router = Router.current()
  return false unless @router
  thisPath = @router.url
  return thisPath


dclib.transpose = (lines) ->
  # debugger
  console.log("lines", lines)
  reels = _.zip.apply(_, lines)
  for reel in reels
    reel = reel.clean()
  reels

  # delete null values

Array::clean = () ->
  ary = this
  i = 0
  while i < ary.length
    val = ary[i]
    if val
      if typeof val == String
        val = val.trim()
        ary[i] = val
    else
      ary.splice(i, 1)
      i--
    i++
  return ary;

