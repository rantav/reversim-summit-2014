class @S2013Controller extends RouteController
  tempalte: 's2013'
  renderTemplates:
    'nav': to: 'nav'

  onAfterRun: ->
    document.title = "2013 | Reversim Summit 2014"

  data: ->
    page: 's2013'