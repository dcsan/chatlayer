@AppConfig = {
  alphas: "ABCDEFGHIJKLMNOPQR".split("")
  nums: [8,7,6,5,4,3,2,1]
}

Meteor.startup ->
  if Meteor.isServer
    ghSettings = Meteor.settings.loginServices.github
    Accounts.loginServiceConfiguration.remove({})
    Accounts.loginServiceConfiguration.insert(ghSettings)
    console.log("configured github", ghSettings)