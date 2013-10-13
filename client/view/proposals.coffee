Template.proposals.events
  'click .delete':  ->
    Proposal.delete(@)

  'click .edit':  ->
    Proposals.update(@_id, $set: editing: (not @editing))

  'click .save': (event, context) ->
    title = context.find("#title-#{@_id}").value
    description = context.find("#description-#{@_id}").value
    if title
      Proposals.update(@_id, $set: {editing: false, title: title, description: description})

Template.proposals.proposals = ->
  Proposals.find({}, sort: createdAt: -1)

Template.proposals.photo = (userId) ->
  userId and User.findOne(userId).photoUrl(40)

Template.proposals.owns = (proposal) ->
  u = Meteor.userId()
  proposal and u and proposal.owner == u

Template.proposals.editMode = ->
  Template.proposals.owns(@) and @editing

Template.proposals.rendered = ->
  $('[data-toggle="tooltip"]').tooltip()

Template.proposals.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')

