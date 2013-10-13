Template.proposal.events
  'click .delete':  ->
    Proposal.delete(@proposal)
    Router.go 'proposals'
    alertify.success('OK, Deleted')

  'click .edit':  ->
    Proposals.update(@proposal._id, $set: editing: (not @proposal.editing))

  'click .save': (event, context) ->
    title = context.find("#title-#{@proposal._id}").value
    description = context.find("#description-#{@proposal._id}").value
    Proposals.update(@proposal._id, $set: {editing: false, title: title, description: description})

Template.proposal.photo = (userId) ->
  userId and User.findOne(userId).photoUrl(40)

Template.proposal.owns = (proposal) ->
  u = Meteor.userId()
  proposal and u and proposal.owner == u

Template.proposal.editMode = ->
  Template.proposal.owns(@proposal) and @proposal.editing

Template.proposal.rendered = ->
  $('[data-toggle="tooltip"]').tooltip()

Template.proposal.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')
