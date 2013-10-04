class @HomeController extends RouteController
  renderTemplates:
    'nav': to: 'nav'
    'home': to: 'main'

  data: ->
    page: 'home'