// Template.messages.events({
//   'submit': function (e, t) {

//     e.preventDefault();

//     var text  = $("#message").val();

//     var user  = Meteor.user().profile.name;
//     var id    = Meteor.user().services.github.id;
//     var user  = Meteor.user().services.github.username;

//     if (text === "") {
//       alert("Please enter your request.")
//       return
//     } 

//     var data = {
//       'user':    id,
//       'name':    user,
//       'message': text,
//       'username': user,
//       'time':    new Date()
//     }

//     Messages.insert(data);
//     $("#message").val("");
//   }
// });