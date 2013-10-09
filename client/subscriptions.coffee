subscriptions = ['wishes', 'users']
window.subscriptionHandles = {}
success = 0
for s in subscriptions
  ((s) ->
    subscriptionHandles[s] = Meteor.subscribe s,
      onReady: -> console.log('ready: ' + s)
      onError: -> console.log('ERROR: ' + s)
  )(s)
