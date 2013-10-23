class @WishesController extends RouteController

  onBeforeRun: ->
    if not subscriptionHandles.wishes
      subscriptionHandles.wishes = Meteor.subscribe('wishes')
      subscriptionHandles.wishes.stop = ->

  waitOn: ->
    [subscriptionHandles.wishes, subscriptionHandles.users]

  tempalte: 'wishes'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'wishes'