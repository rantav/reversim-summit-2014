Template.wishes.events
  'submit form#suggest': (event) ->
    event.preventDefault()
    title = $('#title').val()
    description = $('#description').val()
    if title
      w = Wish.makeWish(title: title, description: description)
      Router.go('wish', {id: w})
      alertify.success('Great, now you can promote it on Twitter')

  'click .vote-up': ->
    u = Meteor.userId()
    if not u
      alertify.log('Please login to vote')
      return

    updateObj  = {}
    schemaPath = "votes.#{u}"
    updateObj[schemaPath] = not @votes[u]

    Wishes.update(@_id, $set: updateObj)

  'click .sign-in': ->
    Accounts._loginButtonsSession.set('dropdownVisible', true);

Template.wishes.wishes = ->
  Wishes.find({}, sort: createdAt: -1)

Template.wishes.photo = (userId) ->
  userId and User.find(userId).photoUrl(40)

Template.wishes.photoSmall = (userId) ->
  u = User.find(userId)
  u.photoUrl(20) if u

Template.wishes.commentsCount = (wish) ->
  wish.comments.length

Template.wishes.hasComments = (wish) ->
  wish.comments.length > 0

Template.wishes.commentsText = (wish) ->
  n = wish.comments.length
  if n == 1 then return '1 comment'
  if n > 1 then return "#{n} comments"

Template.wishes.owns = (wish) ->
  u = Meteor.userId()
  wish and u and wish.owner == u

Template.wishes.editMode = ->
  Template.wishes.owns(@) and @editing

votes = (wish) ->
  user for user, vote of wish.votes when vote
votesMoreThreshold = 6

Template.wishes.positiveVotesShort = (wish) ->
  votes(wish).slice(0, votesMoreThreshold)

Template.wishes.positiveVotesHasMore = (wish) ->
  votes(wish).length > votesMoreThreshold

Template.wishes.positiveVotesMore = (wish) ->
  votes(wish).length - votesMoreThreshold

Template.wishes.rendered = ->
  $('[data-toggle="tooltip"]').tooltip()

Template.wishes.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')

