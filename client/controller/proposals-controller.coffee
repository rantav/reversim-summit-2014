class @ProposalsController extends RouteController

  waitOn: -> [subscriptionHandles['proposals'], subscriptionHandles['users']]

  tempalte: 'proposals'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'proposals'