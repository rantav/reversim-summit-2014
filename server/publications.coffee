wishPred = $or: [{deleted: $exists: false}, {deleted: false}]

Meteor.publish "wishes", ->
  Wishes.find(wishPred)

Meteor.publish "wish", (id)->
  check(id, String)
  Wishes.find($and: [_id: id, wishPred])

userFields =
  roles: 1
  profile: 1
  'services.google.picture': 1
  'services.facebook.id': 1
  'services.twitter.profile_image_url': 1
  'services.github.picture': 1 # This one's prepopulated at Accounts.onCreateUser since github by default does not add the picture (avatar) url

Meteor.publish "users", ->
  User.find {},
    fields: userFields

speakerPred = 'profile.submitted': true
Meteor.publish "speakers", ->
  User.find(speakerPred, fields: userFields)

Meteor.publish "speaker", (id)->
  check(id, String)
  User.find($and: [_id: id, speakerPred], fields: userFields)

Meteor.publish "moderators", ->
  User.find {'roles.moderator': true},
    fields: userFields

proposalPred = $or: [{deleted: $exists: false}, {deleted: false}]
Meteor.publish "proposals", ->
  Proposal.find(proposalPred)

Meteor.publish "proposal", (id)->
  check(id, String)
  Proposal.find($and: [_id: id, proposalPred])


# publish the current size of the collections
Meteor.publish 'counts', ->
  collections =
    wishes: collection: Wishes, pred: wishPred
    proposals: collection: Proposal._collection, pred: proposalPred
    speakers: collection: User._collection, pred: speakerPred
  for name, data of collections
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
  @ready()

