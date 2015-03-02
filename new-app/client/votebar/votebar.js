Template.votebar.helpers({

    returnTeamName: function() {
        var teamName = Session.get('teamName');
        return TeamName.find({})
    },
    returnResults: function() {
        return Votes.find()
    }

});

Template.votebar.events({
    'click .yes': function() {
        // var teamName = $('.teamName').text()
        var teamName = TeamName.getCurrent()

        // Session.set('teamName', teamName);
        Meteor.call('voteYes', teamName, function() {

        })

    },
    'click .no': function() {
        var teamName = TeamName.getCurrent()
        Meteor.call('voteNo', teamName, function() {
        })

    }
});