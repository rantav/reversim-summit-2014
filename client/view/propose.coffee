Template.propose.events
  'submit form': (event, c) ->
    event.preventDefault()
    title = c.find('#title').value
    abstract = c.find('#abstract').value
    typeArr = $('input[name=type]:checked')
    if typeArr.length == 1
      type = typeArr[0].id
    name = c.find('#name').value
    bio = c.find('#bio').value
    trackRecord = c.find('#trackRecord').value
    if name then @update('profile.name': name)
    if bio then @update('profile.bio': bio)
    if trackRecord then @update('profile.trackRecord': trackRecord)
    if title and abstract and type
      abstract = Markdown.removeHeadings(abstract)
      p = Proposal.propose(title: title, abstract: abstract, type: type)
      User.current().update('profile.submitted': true)
      Router.go('proposal', {id: p.id})
      alertify.success('Thank you!')

  'click .sign-in': ->
    Accounts._loginButtonsSession.set('dropdownVisible', true);

Template.propose.hasBio = (speaker) ->
  speaker.hasBio()

Template.propose.speaker = ->
  User.current()