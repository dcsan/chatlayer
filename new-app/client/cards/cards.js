
Template.cards.helpers({
  cards: function () {
    return Requests.find({}, {sort: { time: -1}});
  },
  time: function () {
       var timex = moment(this.time).startOf('hour').fromNow(); 
    return timex;
  },

  // dont show cards with no text
  hastext: function(blob) {
    return (blob.request.length > 1)
  }
});
