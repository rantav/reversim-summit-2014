Template.voteWidget.rendered = ->
  $(@find('[data-toggle="tooltip"]')).tooltip()

Template.voteWidget.destroyed = ->
  try
    $(@find('[data-toggle="tooltip"]')).tooltip('destroy')
  catch e

Template.voteWidget.votingEnabled = ->
  true

Template.voteWidget.events
  'click .vote-up': ->
    u = Meteor.userId()
    if not u
      alertify.log('Please login to vote')
      return
    @toggleVote()
