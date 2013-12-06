Meteor.subscribe('counts')
Meteor.subscribe('sponsors', {}, {fields: {name: 1, logoSmallUrl: 1}})
# register for me
Meteor.subscribe('users', {_id: Meteor.userId()})