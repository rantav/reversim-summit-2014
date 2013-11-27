class @CocController extends RouteController
  tempalte: 'coc'

  after: -> document.title = "Code or Conduct | Reversim Summit 2014"

  data: ->
    page: 'coc'