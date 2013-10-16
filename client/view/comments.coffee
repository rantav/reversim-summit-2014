Template.comments.events
  'click .sign-in': ->
    Accounts._loginButtonsSession.set('dropdownVisible', true);

  'submit form': (event) ->
    event.preventDefault()
    content = $('#add-comment').val()
    if content
      @addComment(content)
      $('#add-comment').val('')

Template.comments.photoSmall = (userId) ->
  userId and User.find(userId).photoUrl(20)
