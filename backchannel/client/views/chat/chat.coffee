Template.chat.helpers
  messages: ->
    # blob = [
    #   {who:'bob', t:1},
    #   {who: 'sam', t:2}
    # ]
    # console.log("blob")
    # return blob
    return Messages.find(
      {},
      {sort:{createdAt:-1} }
    )