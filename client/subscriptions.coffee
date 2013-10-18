subscriptions = ['wishes', 'proposals', 'users', 'speakers']
window.subscriptionHandles = {}
success = 0
for s in subscriptions
  ((s) ->
    subscriptionHandles[s] = Meteor.subscribe s,
      onReady: -> console.log('ready: ' + s)
      onError: -> console.log('ERROR: ' + s)
  )(s)
