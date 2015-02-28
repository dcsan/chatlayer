Template.chatInput.events

  "submit": (event) ->

    event.preventDefault()

    want = $("#want").val()
    table = $("#table").val()

    msg = {
      want: want
      table: table
      createdAt: new Date()
    }

    Messages.insert(msg)

    $("#want").val("")
    $("#table").val("")
    console.log("added", msg)

    return false
