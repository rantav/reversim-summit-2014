Meteor.publish "wishes", ->
  Wishes.find($or: [{deleted: $exists: false}, {deleted: false}])

userFields =
  profile: 1
  'services.google.picture': 1
  'services.facebook.id': 1
  'services.twitter.profile_image_url': 1
  'services.github.picture': 1 # This one's prepopulated at Accounts.onCreateUser since github by default does not add the picture (avatar) url

Meteor.publish "users", ->
  User.find {},
    fields: userFields

Meteor.publish "speakers", ->
  User.find {'profile.submitted': true},
    fields: userFields

Meteor.publish "proposals", ->
  Proposal.find($or: [{deleted: $exists: false}, {deleted: false}])
