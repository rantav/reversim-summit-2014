class @SpeakersController extends RouteController

  waitOn: -> Meteor.subscribe('proposals')

  after: -> document.title = "Speakers | Reversim Summit 2014"

  tempalte: 'speakers'

  data: ->
    page: 'speakers'
    speakers: User.allSpeakers()