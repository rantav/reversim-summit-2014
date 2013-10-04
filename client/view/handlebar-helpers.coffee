Handlebars.registerHelper 'loggedIn', ->
  !!Meteor.userId()

Handlebars.registerHelper 'userName', (userId)->
  u = User.findOne(userId)
  u and u.name()
