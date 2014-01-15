class @HomeController extends FastRender.RouteController
  tempalte: 'home'

  after: -> document.title = "Reversim Summit 2014"

 data: ->
    page: 'home'