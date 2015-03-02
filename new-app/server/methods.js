Meteor.methods({
    voteYes: function(teamName) {
        console.log(teamName)
        Votes.upsert({
            team: teamName
        }, {
            $inc: {
                total: 1
            }
        }, console.log('yes vote recorded'));

    },
    voteNo: function(teamName) {
        console.log(teamName)
        Votes.update({
            team: teamName
        }, {
            $inc: {
                total: -1
            }
        }, console.log('no vote recorded'));

    }
});

// Meteor.startup(function() {
//     if (Votes.find().count() === 0) {
        
//         teamObject = {
//         	teamName: "Team 1"
//         }

//         obj1 = {
//             team: "Team 1",
//             total: 0
//         }
//         obj2 = {
//             team: "Team 2",
//             total: 0
//         }
//         obj3 = {
//             team: "Team 3",
//             total: 0
//         }
//         obj4 = {
//             team: "Team 4",
//             total: 0
//         }
//         obj5 = {
//             team: "Team 5",
//             total: 0
//         }
//         obj6 = {
//             team: "Team 6",
//             total: 0
//         }
//         obj7 = {
//             team: "Team 7",
//             total: 0
//         }
//         obj8 = {
//             team: "Team 8",
//             total: 0
//         }
//         obj9 = {
//             team: "Team 9",
//             total: 0
//         }
//         obj10 = {
//             team: "Team 10",
//             total: 0
//         }
//         obj11 = {
//             team: "Team 11",
//             total: 0
//         }
//         obj12 = {
//             team: "Team 12",
//             total: 0
//         }
//         obj13 = {
//             team: "Team 13",
//             total: 0
//         }
//         obj14 = {
//             team: "Team 14",
//             total: 0
//         }
//         obj15 = {
//             team: "Team 15",
//             total: 0
//         }
        
//         TeamName.insert(teamObject);
//         Votes.insert(obj1);
//         Votes.insert(obj2);
//         Votes.insert(obj3);
//         Votes.insert(obj4);
//         Votes.insert(obj5);
//         Votes.insert(obj6);
//         Votes.insert(obj7);
//         Votes.insert(obj8);
//         Votes.insert(obj9);
//         Votes.insert(obj10);
//         Votes.insert(obj11);
//         Votes.insert(obj12);
//         Votes.insert(obj13);
//         Votes.insert(obj14);
//         Votes.insert(obj15);
//     }
// });