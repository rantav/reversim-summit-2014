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

  'click .vote-up': ->
    u = Meteor.userId()
    if not u
      alertify.log('Please login to vote')
      return

    updateObj  = {}
    schemaPath = "votes.#{u}"
    updateObj[schemaPath] = not @votes[u]

    Wishes.update(@_id, $set: updateObj)

Template.wish.wishes = ->
  editing.depend()
  Wishes.find({}, sort: createdAt: -1)

Template.wish.photo = (userId) ->
  userId and User.findOne(userId).photoUrl(40)

Template.wish.photoSmall = (userId) ->
  userId and User.findOne(userId).photoUrl(20)

Template.wish.owns = (wish) ->
  u = Meteor.userId()
  wish and u and wish.owner == u

Template.wish.editMode = ->
  Template.wish.owns(@) and @editing

Template.wish.positiveVotes = (wish) ->
  user for user, vote of wish.votes when vote

Template.wish.rendered = ->
  $('[data-toggle="tooltip"]').tooltip()

Template.wish.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')

