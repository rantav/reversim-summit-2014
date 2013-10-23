class @UsersController extends RouteController

  waitOn: -> [subscriptionHandles['users']]

  onAfterRun: ->
    document.title = "Users | Reversim Summit 2014"

  tempalte: 'users'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'users'

