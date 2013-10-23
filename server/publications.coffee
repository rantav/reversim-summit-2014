wishPred = $or: [{deleted: $exists: false}, {deleted: false}]

Meteor.publish "wishes", ->
  Wishes.find(wishPred)

Meteor.publish "wishCount", ->
  Wishes.find(wishPred, fields: _id: 1)

Meteor.publish "wish", (id)->
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
  User.find($and: [_id: id, speakerPred], fields: userFields)

Meteor.publish "speakerCount", ->
  User.find(speakerPred, fields: _id: 1)

Meteor.publish "moderators", ->
  User.find {'roles.moderator': true},
    fields: userFields

proposalPred = $or: [{deleted: $exists: false}, {deleted: false}]
Meteor.publish "proposals", ->
  Proposal.find(proposalPred)

Meteor.publish "proposal", (id)->
  Proposal.find($and: [_id: id, proposalPred])

Meteor.publish "proposalCount", ->
  Proposal.find(proposalPred, fields: _id: 1)
