class @UsersController extends RouteController

  waitOn: -> [subscriptionHandles['users']]

  tempalte: 'users'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'users'

