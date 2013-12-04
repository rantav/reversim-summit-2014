userFields =
  roles: 1
  profile: 1
  'services.google.picture': 1
  'services.facebook.id': 1
  'services.twitter.profile_image_url': 1
  'services.github.picture': 1 # This one's prepopulated at Accounts.onCreateUser since github by default does not add the picture (avatar) url

notDeletedPred = {$or: [{deleted: $exists: false}, {deleted: false}]}

Meteor.publish "wishes", (query, options) ->
  options = {} if not options
  query = {} if not query
  wishes = Wishes.find(_.extend(query, notDeletedPred), options)
  # This can be improved to add only the users that commented or voted or created on the relevant wishes
  users = User.find({}, {fields: userFields})
  [wishes, users]

Meteor.publish "users",(query, options) ->
  options = {} if not options
  query = {} if not query
  User.find(query, _.extend(options, {fields: userFields}))

speakerPred = 'profile.submitted': true
Meteor.publish "speakers", (query, options) ->
  options = {} if not options
  query = {} if not query
  users = User.find(_.extend(query, speakerPred), _.extend(options, {fields: userFields}))
  userIds = users.map((u)->u._id)
  proposals = Proposal.find({user_id: {$in: userIds}})
  [users, proposals]

Meteor.publish "moderators", ->
  User.find {'roles.moderator': true},
    fields: userFields

Meteor.publish "proposals", (query, options) ->
  options = {} if not options
  query = {} if not query
  proposals = Proposal.find(_.extend(query, notDeletedPred), options)
  userIds = proposals.map((p) -> p.user_id)
  users = User.find({_id: $in: userIds}, {fields: userFields})
  [proposals, users]

Meteor.publish "sponsors", (query, options) ->
  options = {} if not options
  query = {} if not query
  sponsors = Sponsor.find(query, options)

# publish the current size of the collections
Meteor.publish 'counts', ->
  collections =
    wishes: collection: Wishes, pred: notDeletedPred
    proposals: collection: Proposal._collection, pred: notDeletedPred
    speakers: collection: User._collection, pred: speakerPred
  for name, data of collections
    ((name, data) =>
      count = 0
      initializing = true
      handle = data.collection.find(data.pred).observeChanges
        added: (id) =>
          count++
          if not initializing
            @changed("counts", name, {count: count})
        removed: (id) =>
          count--
          @changed("counts", name, {count: count})

      # Observe only returns after the initial added callbacks have run.
      # Now return an initial value and mark the subscription as ready.
      initializing = false;
      @added("counts", name, {count: count})

      # Stop observing the cursor when client unsubs.
      # Stopping a subscription automatically takes
      # care of sending the client any removed messages.
      @onStop ->
        handle.stop()
    )(name, data)
  @ready()

