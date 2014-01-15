class @AboutController extends FastRender.RouteController

  after: -> document.title = "About Reversim Summit 2014"

  waitOn: -> Meteor.subscribe('moderators')

  tempalte: 'about'

  data: ->
    page: 'about'