Handlebars.registerHelper 'loggedIn', ->
  !!Meteor.userId()

Handlebars.registerHelper 'userName', (userId)->
  u = User.findOne(userId)
  u and u.name()

Handlebars.registerHelper 'userVotedWishStr', (wish)->
  u = Meteor.userId()
  if u and wish.votes[u] then 'true' else 'false'

Handlebars.registerHelper 'twitterShareWishUrl', (wish)->
  if wish
    shareText = "I wish there was a talk about \"#{wish.title}\" at #reversim summit. Vote me up!"
    url = Router.path('wish', {id: wish._id})
    "https://twitter.com/share?url=#{encodeURIComponent(url)}&text=#{encodeURIComponent(shareText)}&via=reversim"
