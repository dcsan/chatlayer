
Template.chatroom.events({
  'submit': function (e, t) {
    e.preventDefault();

    var text  = $("#textarea").val();
    var table = $("#table").val();
    var user  = Meteor.user().profile.name;
    var id    = Meteor.user().services.github.id;
    var user = Meteor.user().services.github.username;

    if (text === "") {
      alert("Please enter your request")
      return
    }

    if (table === "") {
      alert("Please enter your table")
      return
    }

    var data = {
      'user':    id,
      'name':    user,
      'table':   table,
      'request': text,
      'username': user,
      'time':    new Date()
    }

    Requests.insert(data);
    console.log("added", data)
  }
});
Template.chatroom.helpers({
  msg: function () {
    return Messages.find({}, {sort: { time: -1}})
  }
});

Template.chatroom.events({
  'submit': function (e, t) {

    e.preventDefault();

    var text  = $("#message").val();

    var user  = Meteor.user().profile.name;
    var id    = Meteor.user().services.github.id;
    var user  = Meteor.user().services.github.username;

    if (text === "") {
      alert("Please enter your request.")
      return
    } 

    var data = {
      'user':    id,
      'name':    user,
      'message': text,
      'username': user,
      'time':    new Date()
    }

    Messages.insert(data);
    $("#message").val("");
  }
});