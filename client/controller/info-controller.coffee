class @InfoController extends RouteController
  tempalte: 'info'
  renderTemplates:
    'nav': to: 'nav'

  onAfterRun: ->
    document.title = "Info | Reversim Summit 2014"

  data: ->
    page: 'info'