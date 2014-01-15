sort = createdAt: -1
class @ProposalsController extends FastRender.RouteController

  waitOn: ->
    limit = @params.limit || 10
    q = {}
    if filterType = @params.filterType
      q.type = filterType
    if filterTag = @params.filterTag
      q.tags = filterTag
    Meteor.subscribe('proposals', q, {limit: limit, sort})

  after: -> document.title = "Proposals | Reversim Summit 2014"

  tempalte: 'proposals'

  data: ->
    page: 'proposals'
    proposals: Proposal.all(sort)
    limit: parseInt(@params.limit || 10)
    filterType: @params.filterType
    filterTag: @params.filterTag