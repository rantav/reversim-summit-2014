class @HomeController extends RouteController
  tempalte: 'home'
  renderTemplates:
    'nav': to: 'nav'

  onAfterRun: ->
    document.title = "Reversim Summit 2014"

 data: ->
    page: 'home'