class @WishesController extends RouteController

  onBeforeRun: ->
    subscriptionHandles.wishes = Meteor.subscribe('wishes')
    subscriptionHandles.wishes.stop = ->

  waitOn: ->
    [subscriptionHandles.wishes, subscriptionHandles.users]

  tempalte: 'wishes'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'wishes'