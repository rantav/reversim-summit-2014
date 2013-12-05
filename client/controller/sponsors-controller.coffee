class @SponsorsController extends RouteController

  waitOn: ->
    Meteor.subscribe('sponsors')

  after: -> document.title = "Sponsors | Reversim Summit 2014"

  tempalte: 'sponsors'

  data: ->
    page: 'sponsors'
    sponsors: _.shuffle(Sponsor.all())
