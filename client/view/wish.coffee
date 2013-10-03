Template.wish.events
  'submit form#suggest': (event) ->
    event.preventDefault()
    title = $('#title').val()
    description = $('#description').val()
    console.log(title)
    console.log(description)
    Wish.makeWish(title: title, description: description)

Template.wish.wishes = ->
  Wishes.find()