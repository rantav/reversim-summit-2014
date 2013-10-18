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
    if typeArr.length == 1
      type = typeArr[0].id
    @proposal.update(editing: false, title: title, abstract: abstract, type: type)

Template.proposal.proposal = -> @proposal

Template.proposal.photo = (user) ->
  user.photoUrl(40)

Template.proposal.editMode = ->
  @proposal.editing and @proposal.mine()

Template.proposal.rendered = ->
  $('[data-toggle="tooltip"]').tooltip()

Template.proposal.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')
