
Meteor.startup(function () {

  // dont send events from dev mode
  if (window.location.host.includes("localhost")) {
    console.log("skipping localhost");
    window.ga = {}
    return;
  } else {
    console.log("init GA")
  }

  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-60202659-1', 'auto');
  ga('send', 'pageview');

  window.ga = ga;

  // global event
  window.gaping = function(params) {
    if (typeof ga=="function") {
      ga('send', 'pageview');
    }
  }

});


