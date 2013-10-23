class @WishesController extends RouteController

  onBeforeRun: ->
    if not subscriptionHandles.wishes
      subscriptionHandles.wishes = Meteor.subscribe('wishes')
      subscriptionHandles.wishes.stop = ->

  waitOn: ->
    [subscriptionHandles.wishes, subscriptionHandles.users]

  onAfterRun: ->
    document.title = "Wishes | Reversim Summit 2014"

  tempalte: 'wishes'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'wishes'