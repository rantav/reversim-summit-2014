class @InfoController extends RouteController
  tempalte: 'info'

  after: -> document.title = "Info | Reversim Summit 2014"

  data: ->
    page: 'info'