class @WishesController extends RouteController

  waitOn: ->
    [Meteor.subscribe('wishes'), subscriptionHandles['users']]

  tempalte: 'wishes'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'wishes'