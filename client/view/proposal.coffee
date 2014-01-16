Template.proposal.events
  'click .delete':  ->
    @proposal.delete()
    Router.go 'proposals'
    alertify.success('OK, Deleted')

  'click .edit':  -> @proposal.toggleEdit()

  'click .save': (event, context) ->
    title = context.find("#title-#{@proposal.id}").value
    abstract = context.find("#abstract-#{@proposal.id}").value
    abstract = Markdown.removeHeadings(abstract)
    typeArr = $('input[name=type]:checked')
    speakerIds = context.find('#speakers').value
    speakerIds = _.uniq(_.compact(speakerIds.split(',').map((s)->s.trim())))
    speakersUpdated = (speakerIds.join(',') != @proposal.speaker_ids.join(','))
    if not (Meteor.userId() in speakerIds) and not User.current().admin()
      alertify.error("You cannot remove yourself as a speaker!")
      return
    if typeArr.length == 1
      type = typeArr[0].id
    @proposal.update(editing: false, title: title, abstract: abstract, type: type, speaker_ids: speakerIds)
    if speakersUpdated
      document.location = document.location

Template.proposal.proposal = -> @proposal
Template.proposal.speakers = -> @proposal.speakers()
Template.proposal.speakerIds = -> @proposal.speakers().map((s) -> s.id)

canEdit = (proposal) ->
  Meteor.userId() and (proposal.mine() or User.current().admin())
  # Meteor.userId() and User.current().admin()

Template.proposal.canEdit = -> canEdit(@proposal)


Template.proposal.photo = (user) ->
  user.photoUrl(40)

Template.proposal.editMode = ->
  @proposal.editing and canEdit(@proposal)

Template.proposal.rendered = ->
  $('[data-toggle="tooltip"]').tooltip()

Template.proposal.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')
