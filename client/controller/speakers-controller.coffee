class @SpeakersController extends RouteController

  waitOn: -> Meteor.subscribe('speakers')

  after: -> document.title = "Speakers | Reversim Summit 2014"

  tempalte: 'speakers'

  data: ->
    page: 'speakers'