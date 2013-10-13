Template.propose.events
  'submit form': (event) ->
    event.preventDefault()
    title = $('#title').val()
    description = $('#description').val()
    if title and description
      p = Proposal.propose(title: title, description: description)
      Router.go('proposal', {id: p})
      alertify.success('Thank you!')

  'click .sign-in': ->
    Accounts._loginButtonsSession.set('dropdownVisible', true);
