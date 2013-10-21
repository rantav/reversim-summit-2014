class @AboutController extends RouteController

  waitOn: -> [subscriptionHandles['moderators']]

  tempalte: 'about'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'about'