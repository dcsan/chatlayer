Requests = new Mongo.Collection("requests");
Messages = new Mongo.Collection("messages");
Votes = new Mongo.Collection("votes");
TeamName = new Mongo.Collection("teamName");


TeamName.setCurrent = function(name) {
	console.log("setting team");
	t = TeamName.findOne({});

	TeamName.update(
		{_id: t._id},
		{$set: {teamName: name}}
	);
}

TeamName.getCurrent = function() {
	t = TeamName.findOne({});
	if (t==null) {
		initTeams();
		return ("backchannel")
	}
	return (t.teamName);
}

function initTeams() {
	t = {
		teamName: "backchannel"
	}
	TeamName.insert(t);
}