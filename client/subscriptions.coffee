Meteor.subscribe('counts')
Meteor.subscribe('sponsors', {}, {fields: {name: 1, logoSmallUrl: 1}})
