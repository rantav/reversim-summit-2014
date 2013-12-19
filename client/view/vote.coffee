# Template.vote.speakers = -> _.shuffle(@speakers)
Template.vote.speakers = -> @speakers

statuses = ['submitted']
Template.vote.shouldDisplay = (speaker) ->
  speaker.hasProposalInStatus(statuses)

Template.vote.photo = (speaker) ->
  speaker.photoUrl(120)

Template.vote.proposals = -> @proposals()

Template.vote.canSeeResults = ->
  u = User.current()
  u and (u.admin() or u.moderator())

Template.vote.rendered = ->
  $('[data-toggle="tooltip"]').tooltip()

Template.vote.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')


Template.vote.events

  'click .vote-up': ->
    u = Meteor.userId()
    if not u
      alertify.log('Please login to vote')
      return

    updateObj  = {}
    schemaPath = "votes.#{u}"
    updateObj[schemaPath] = not @votes[u]

    Proposal._collection.update({_id: @id}, $set: updateObj)

  'click .sign-in': ->
    Accounts._loginButtonsSession.set('dropdownVisible', true);
