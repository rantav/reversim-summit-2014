class @AboutController extends RouteController
  renderTemplates:
    'nav': to: 'nav'
    'about': to: 'main'

  data: ->
    page: 'about'