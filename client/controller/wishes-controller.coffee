class @WishesController extends RouteController

  waitOn: -> [subscriptionHandles['wishes'], subscriptionHandles['users']]

  tempalte: 'wishes'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'wishes'