class @ProposeController extends RouteController
  waitOn: -> subscriptionHandles['users']
  template: 'propose'
  renderTemplates:
    'nav': to: 'nav'

  onAfterRun: ->
    document.title = "Propose | Reversim Summit 2014"

  data: ->
    page: 'propose'


