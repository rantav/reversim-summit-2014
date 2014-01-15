class @CocController extends FastRender.RouteController
  tempalte: 'coc'

  after: -> document.title = "Code of Conduct | Reversim Summit 2014"

  data: ->
    page: 'coc'