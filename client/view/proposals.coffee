Template.proposals.proposals = -> @proposals

Template.proposals.photo = (user) -> user.photoUrl(120) if user

Template.proposals.canSeeNumLoaded = ->
  u = User.current()
  u and (u.admin() or u.moderator())

Template.proposals.numLoaded = -> @proposals.length if @proposals

Template.proposals.rendered = ->
  $('[data-toggle="tooltip"]').tooltip()

Template.proposals.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')

Template.proposals.hasMore = ->
  count = Counts.findOne('proposals')
  count and count.count > Proposal.count()

Template.proposals.filterByTypeUrl = ->
  Router.path('proposals') + "?filterType=#{@type}"

Template.proposals.canTag = ->
  u = User.current()
  u and (u.admin() or u.moderator())

Template.proposals.events
  'click #load-more': ->
    path = Router.path('proposals', {limit: @limit + 10})
    if @filterType
      path += "?filterType=#{@filterType}"
    Router.go(path)

  'click .vote-up': ->
    u = Meteor.userId()
    if not u
      alertify.log('Please login to vote')
      return
    @toggleVote()
