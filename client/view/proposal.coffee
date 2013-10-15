Template.proposal.events
  'click .delete':  ->
    @proposal.delete()
    Router.go 'proposals'
    alertify.success('OK, Deleted')

  'click .edit':  -> @proposal.toggleEdit()

  'click .save': (event, context) ->
    title = context.find("#title-#{@proposal.id}").value
    abstract = context.find("#abstract-#{@proposal.id}").value
    @proposal.update(editing: false, title: title, abstract: abstract)

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
