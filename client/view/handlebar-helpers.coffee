Handlebars.registerHelper 'loggedIn', ->
  !!Meteor.userId()
