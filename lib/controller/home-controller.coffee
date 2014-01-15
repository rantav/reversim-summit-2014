class @HomeController extends RouteController
  tempalte: 'home'

  after: -> document.title = "Reversim Summit 2014"

 data: ->
    page: 'home'