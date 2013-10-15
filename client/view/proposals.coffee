Template.proposals.events
  'click .delete':  -> @delete()

  'click .edit':  -> @toggleEdit()

  'click .save': (event, context) ->
    title = context.find("#title-#{@id}").value
    abstract = context.find("#abstract-#{@id}").value
    if title and abstract
      @update(editing: false, title: title, abstract: abstract)

Template.proposals.proposals = ->
  Proposal.all(sort: createdAt: -1)

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

