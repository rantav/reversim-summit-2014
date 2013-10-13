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
    Wish.delete(@)

  'click .edit':  ->
    Wishes.update(@_id, $set: editing: (not @editing))

  'click .save': (event, context) ->
    title = context.find("#title-#{@_id}").value
    description = context.find("#description-#{@_id}").value
    if title
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

  'click .sign-in': ->
    Accounts._loginButtonsSession.set('dropdownVisible', true);

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

votes = (wish) ->
  user for user, vote of wish.votes when vote
votesMoreThreshold = 6

Template.wishes.positiveVotesShort = (wish) ->
  votes(wish).slice(0, votesMoreThreshold)

Template.wishes.positiveVotesHasMore = (wish) ->
  votes(wish).length > votesMoreThreshold

Template.wishes.positiveVotesMore = (wish) ->
  votes(wish).length - votesMoreThreshold

Template.wishes.disqusPath = (wish)->
  url = Meteor.absoluteUrl().slice(0, -1) + Router.path('wish', id: wish._id)
  url += '#disqus_thread'
  url

Template.wishes.rendered = ->
  `
  var disqus_shortname = 'summit2014';

  /* * * DON'T EDIT BELOW THIS LINE * * */
  (function () {
  var s = document.createElement('script'); s.async = true;
  s.type = 'text/javascript';
  s.src = 'http://' + disqus_shortname + '.disqus.com/count.js';
  (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
  }());
  `
  # Add <a href='{{disqusPath .}}'></a> somewhere in the template
  $('[data-toggle="tooltip"]').tooltip()


Template.wishes.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')

