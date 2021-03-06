Handlebars.registerHelper 'loggedIn', ->
  !!Meteor.userId()

Handlebars.registerHelper 'isAdmin', ->
  cur = User.current()
  cur and cur.admin()

# Is this user me?
Handlebars.registerHelper 'me', (user)->
  user.id == Meteor.userId()

Handlebars.registerHelper 'userName', (userId)->
  u = User.find(userId)
  u and u.name()

Handlebars.registerHelper 'userVotedWishStr', (wish)->
  u = Meteor.userId()
  if u and wish.votes[u] then 'true' else 'false'

Handlebars.registerHelper 'userVotedStr', (item)->
  u = Meteor.userId()
  if u and item.votes and item.votes[u] then 'true' else 'false'

Handlebars.registerHelper 'twitterShareWishUrl', (wish)->
  if wish
    url = Router.fullPath('wish', id: wish._id)
    shareText = "I wish there was a talk about \"#{wish.title}\" at #reversim summit. Help by voting!"
    "https://twitter.com/share?url=#{encodeURIComponent(url)}&text=#{encodeURIComponent(shareText)}&via=reversim"

Handlebars.registerHelper 'twitterShareProposalUrl', (proposal)->
  if proposal
    url = Router.fullPath('proposal', id: proposal.id)
    shareText = "Submitted to reversim conf: \"#{proposal.title}\""
    "https://twitter.com/share?url=#{encodeURIComponent(url)}&text=#{encodeURIComponent(shareText)}&via=reversim"


Handlebars.registerHelper 'staticImg', (path)->
  Cdn.cdnify(path)

Handlebars.registerHelper 'wishVoteTooltip', (item) ->
  u = Meteor.userId()
  if not u then return "Login to vote"
  if item.votes and item.votes[u] then 'Unvote' else 'Vote'

Handlebars.registerHelper 'marked', (text) ->
  if text then marked(text)

# Help handelbars iterate over objects by turning them into arrays
Handlebars.registerHelper 'arrayify', (obj) ->
  ({key: key, value: value} for key, value of obj)

Handlebars.registerHelper 'proposalTypes', ->
  u = User.current()
  types = Proposal.types()
  if not u or not u.admin()
    delete types['keynote']
  types

Handlebars.registerHelper 'pathWish', (obj) ->
  Router.path('wish', {id: obj.hash.id, title: obj.hash.title})
