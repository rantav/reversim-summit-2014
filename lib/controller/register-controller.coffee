class @RegisterController extends FastRender.RouteController

  after: -> document.title = "Register | Reversim Summit 2014"

  tempalte: 'register'

  data: ->
    page: 'register'