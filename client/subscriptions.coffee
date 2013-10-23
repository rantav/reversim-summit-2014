subscriptions = ['wishCount', 'proposalCount', 'users', 'speakerCount']
window.subscriptionHandles = {}
success = 0
for s in subscriptions
  ((s) ->
    subscriptionHandles[s] = Meteor.subscribe(s)
  )(s)
