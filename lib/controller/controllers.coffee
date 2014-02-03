class @HomeController extends FastRender.RouteController
  tempalte: 'home'
  after: -> document.title = "Reversim Summit 2014"
  data: -> page: 'home'

class @CommunityController extends FastRender.RouteController
  tempalte: 'community'
  after: -> document.title = "Community | Reversim Summit 2014"
  data: -> page: 'community'