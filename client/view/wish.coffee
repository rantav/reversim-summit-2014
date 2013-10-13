Template.wish.events
  'click .delete':  ->
    Wish.delete(@wish)
    Router.go 'wishes'
    alertify.success('OK, Deleted')

  'click .edit':  ->
    Wishes.update(@wish._id, $set: editing: (not @wish.editing))

  'click .save': (event, context) ->
    title = context.find("#title-#{@wish._id}").value
    description = context.find("#description-#{@wish._id}").value
    Wishes.update(@wish._id, $set: {editing: false, title: title, description: description})

  'click .vote-up': ->
    u = Meteor.userId()
    if not u
      alertify.log('Please login to vote')
      return

    updateObj  = {}
    schemaPath = "votes.#{u}"
    updateObj[schemaPath] = not @wish.votes[u]

    Wishes.update(@wish._id, $set: updateObj)

wish = null
Template.wish.wish = ->
  wish = @wish
  @wish

Template.wish.wishObj = ->
  new Wish(@wish)

Template.wish.positiveVotes = ->
  user for user, vote of @wish.votes when vote

Template.wish.photo = (userId) ->
  userId and User.findOne(userId).photoUrl(40)

Template.wish.photoSmall = (userId) ->
  userId and User.findOne(userId).photoUrl(20)

Template.wish.owns = (wish) ->
  u = Meteor.userId()
  wish and u and wish.owner == u

Template.wish.editMode = ->
  Template.wish.owns(@wish) and @wish.editing

Template.wish.rendered = ->
  window.disqus_url = Meteor.absoluteUrl().slice(0, -1) + Router.path('wish', id: wish._id)
  $('[data-toggle="tooltip"]').tooltip()

Template.wish.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')

