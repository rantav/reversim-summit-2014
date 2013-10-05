class @AboutController extends RouteController
  tempalte: 'about'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'about'