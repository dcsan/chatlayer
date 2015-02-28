Template.chatInput.events

  "submit": (event) ->

    event.preventDefault()

    console.log("added", text)
    text = $("#inputField").val()

    Messages.insert({
      text: text,
      createdAt: new Date()
    })

    $("#inputField").val("")

    return false
