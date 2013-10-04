editing = new Deps.Dependency()

Template.wish.events
  'submit form#suggest': (event) ->
    event.preventDefault()
    title = $('#title').val()
    description = $('#description').val()
    if title or description
      Wish.makeWish(title: title, description: description)

  'click .delete':  ->
    Wishes.remove(@_id)

  'click .edit':  ->
    Wishes.update(@_id, $set: editing: (not @editing))

  'click .update': (event, context) ->
    title = context.find("#title-#{@_id}").value
    description = context.find("#description-#{@_id}").value
    Wishes.update(@_id, $set: {editing: false, title: title, description: description})

Template.wish.wishes = ->
  editing.depend()
  Wishes.find({}, sort: createdAt: -1)

Template.wish.photo = (userId) ->
  userId and User.findOne(userId).photoUrl(40)

Template.wish.owns = (wish) ->
  u = Meteor.userId()
  wish and u and wish.owner == u

Template.wish.editMode = ->
  Template.wish.owns(@) and @editing
