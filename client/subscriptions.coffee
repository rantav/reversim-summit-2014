subscriptions = ['users', 'counts']
window.subscriptionHandles = {}
for s in subscriptions
  subscriptionHandles[s] = Meteor.subscribe(s)
