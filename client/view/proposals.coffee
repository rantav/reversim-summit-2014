Template.proposals.proposals = ->
  Proposal.all(sort: createdAt: -1)

Template.proposals.photo = (user) ->
  user.photoUrl(120)

Template.proposals.rendered = ->
  $('[data-toggle="tooltip"]').tooltip()

Template.proposals.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')

Template.proposals.hasMore = ->
  count = Counts.findOne('proposals')
  count and count.count > Proposal.count()

Template.proposals.events
  'click #load-more': ->
    Router.go('proposals', {limit: @limit + 10})