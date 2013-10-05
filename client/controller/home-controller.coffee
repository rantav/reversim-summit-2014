class @HomeController extends RouteController
  tempalte: 'home'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'home'