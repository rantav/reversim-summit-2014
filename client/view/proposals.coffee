Template.proposals.proposals = ->
  Proposal.all(sort: createdAt: -1)

Template.proposals.photo = (userId) ->
  userId and User.findOne(userId).photoUrl(40)

Template.proposals.rendered = ->
  $('[data-toggle="tooltip"]').tooltip()

Template.proposals.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')

