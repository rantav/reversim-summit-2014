Template.wishes.events
  'submit form#suggest': (event) ->
    event.preventDefault()
    title = $('#title').val()
    description = $('#description').val()
    if title
      w = Wish.makeWish(title: title, description: description)
      Router.go('wish', {id: w})
      alertify.success('Great, now you can promote it on Twitter')

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

Template.wishes.wishes = ->
  Wishes.find({}, sort: createdAt: -1)

Template.wishes.photo = (userId) ->
  userId and User.findOne(userId).photoUrl(40)

Template.wishes.photoSmall = (userId) ->
  userId and User.findOne(userId).photoUrl(20)

Template.wishes.owns = (wish) ->
  u = Meteor.userId()
  wish and u and wish.owner == u

Template.wishes.editMode = ->
  Template.wishes.owns(@) and @editing

Template.wishes.positiveVotes = (wish) ->
  user for user, vote of wish.votes when vote

Template.wishes.rendered = ->
  $('[data-toggle="tooltip"]').tooltip()

Template.wishes.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')

