class @WishesController extends RouteController

  waitOn: -> [subscriptionHandles['wishes'], subscriptionHandles['users']]

  renderTemplates:
    'nav': to: 'nav'
    'wishes': to: 'main'

  data: ->
    page: 'wishes'