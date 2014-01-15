# Meteor.subscribe('counts')
# Meteor.subscribe('sponsors', {}, {fields: {name: 1, logoSmallUrl: 1}})
# register for me
if Meteor.userId()
  Meteor.subscribe('users', {_id: Meteor.userId()})
  Meteor.subscribe('speakers', {_id: Meteor.userId()})