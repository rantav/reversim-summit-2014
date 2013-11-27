class @ProposalsController extends RouteController

  waitOn: ->
    limit = @params.limit || 10
    Meteor.subscribe('proposals', {}, {limit: limit})

  after: -> document.title = "Proposals | Reversim Summit 2014"

  tempalte: 'proposals'

  data: ->
    page: 'proposals'
    limit: parseInt(@params.limit || 10)