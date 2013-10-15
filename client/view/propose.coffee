Template.propose.events
  'submit form': (event) ->
    event.preventDefault()
    title = $('#title').val()
    abstract = $('#abstract').val()
    if title and abstract
      p = Proposal.propose(title: title, abstract: abstract)
      Router.go('proposal', {id: p})
      alertify.success('Thank you!')

  'click .sign-in': ->
    Accounts._loginButtonsSession.set('dropdownVisible', true);
