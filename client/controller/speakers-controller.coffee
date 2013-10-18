class @SpeakersController extends RouteController

  waitOn: -> [subscriptionHandles['proposals'], subscriptionHandles['speakers']]

  tempalte: 'speakers'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'speakers'