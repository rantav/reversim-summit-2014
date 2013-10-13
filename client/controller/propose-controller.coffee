class @ProposeController extends RouteController
  waitOn: -> subscriptionHandles['users']
  template: 'propose'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'propose'


