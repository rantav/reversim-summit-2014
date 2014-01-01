userFields =
  roles: 1
  proposal_ids: 1
  profile: 1
  'services.google.picture': 1
  'services.google.email': 1
  'services.facebook.id': 1
  'services.facebook.email': 1
  'services.twitter.profile_image_url': 1
  'services.github.picture': 1
  'services.github.email': 1

proposalFields = (userId, minimal)->
  fields =
    createdAt: 1
    status: 1
    title: 1
    type: 1
    speaker_ids: 1
    tags: 1
  if not minimal
    fields.abstract = 1
    fields.editing = 1
  if userId
    user = User.find(userId)
    if user and (user.admin() or user.moderator())
      fields.votes = 1
    else
      fields["votes.#{userId}"] = 1
  fields

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
  proposals = Proposal.find(_.extend({speaker_ids: {$in: userIds}}, notDeletedPred),
                            {fields: proposalFields(@userId)})
  [users, proposals]

Meteor.publish "moderators", ->
  User.find {'roles.moderator': true},
    fields: userFields

Meteor.publish "proposals-min", (query, options) ->
  options = {} if not options
  query = {} if not query
  proposals = Proposal.find(_.extend(query, notDeletedPred), _.extend(options, {fields: proposalFields(@userId, true)}))
  userIds = _.flatten(proposals.map((p) -> p.speaker_ids))
  users = User.find({_id: $in: userIds}, {fields: userFields})
  [proposals, users]

Meteor.publish "proposals", (query, options) ->
  options = {} if not options
  query = {} if not query
  proposals = Proposal.find(_.extend(query, notDeletedPred), _.extend(options, {fields: proposalFields(@userId)}))
  userIds = _.flatten(proposals.map((p) -> p.speaker_ids))
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

