Handlebars.registerHelper 'loggedIn', ->
  !!Meteor.userId()

Handlebars.registerHelper 'userName', (userId)->
  u = User.findOne(userId)
  u and u.name()

Handlebars.registerHelper 'userVotedWishStr', (wish)->
  u = Meteor.userId()
  if u and wish.votes[u] then 'true' else 'false'
