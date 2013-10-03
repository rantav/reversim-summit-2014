Template.wish.events
  'submit form#suggest': (event) ->
    event.preventDefault()
    title = $('#title').val()
    description = $('#description').val()
    if title or description
      Wish.makeWish(title: title, description: description)

  'click .delete':  ->
    Wishes.remove(@_id)

Template.wish.wishes = ->
  Wishes.find({}, sort: createdAt: -1)

Template.wish.photo = (userId) ->
  userId and User.findOne(userId).photoUrl(40)

Template.wish.owns = (wish) ->
  u = Meteor.userId()
  wish and u and wish.owner == u