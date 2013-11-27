sort = createdAt: -1
class @ProposalsController extends RouteController

  waitOn: ->
    limit = @params.limit || 10
    Meteor.subscribe('proposals', {}, {limit: limit, sort})

  after: -> document.title = "Proposals | Reversim Summit 2014"

  tempalte: 'proposals'

  data: ->
    page: 'proposals'
    proposals: Proposal.all(sort)
    limit: parseInt(@params.limit || 10)