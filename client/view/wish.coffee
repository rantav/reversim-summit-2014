Template.wish.events
  'submit form#suggest': (event) ->
    event.preventDefault()
    title = $('#title').val()
    description = $('#description').val()
    if title or description
      Wish.makeWish(title: title, description: description)

Template.wish.wishes = ->
  Wishes.find()

Template.wish.photo = (userId) ->
  User.findOne(userId).photoUrl(40)