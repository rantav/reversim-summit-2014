class @AboutController extends RouteController

  after: -> document.title = "About Reversim Summit 2014"

  waitOn: -> Meteor.subscribe('moderators')

  tempalte: 'about'

  data: ->
    page: 'about'