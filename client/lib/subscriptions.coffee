subscriptions = ['wishes']
window.subscriptionHandles = {}
success = 0
for s in subscriptions
  ((s) ->
    subscriptionHandles[s] = Meteor.subscribe s,
      onReady: -> log.info('ready: ' + s)
      onError: -> log.error('ERROR: ' + s)
  )(s)
