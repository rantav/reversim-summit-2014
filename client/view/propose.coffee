Template.propose.events
  'submit form': (event, c) ->
    event.preventDefault()
    title = c.find('#title').value
    abstract = c.find('#abstract').value
    if title and abstract
      p = Proposal.propose(title: title, abstract: abstract)
      Router.go('proposal', {id: p.id})
      alertify.success('Thank you!')

  'click .sign-in': ->
    Accounts._loginButtonsSession.set('dropdownVisible', true);
