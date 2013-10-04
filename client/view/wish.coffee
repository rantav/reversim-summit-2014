Template.wish.wish = ->
  @wish

Template.wish.positiveVotes = ->
  user for user, vote of @wish.votes when vote

Template.wish.photo = (userId) ->
  userId and User.findOne(userId).photoUrl(40)

Template.wish.photoSmall = (userId) ->
  userId and User.findOne(userId).photoUrl(20)

Template.wish.rendered = ->
  $('[data-toggle="tooltip"]').tooltip()

Template.wish.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')

