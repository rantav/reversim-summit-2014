class @ProposalController extends FastRender.RouteController

  waitOn: ->
    Meteor.subscribe('proposals', {_id: @params.id})

  tempalte: 'proposal'

  notFoundTemplate: 'notFound'

  data: ->
    proposal = Proposal.find(@params.id)
    if not proposal then return null
    document.title = "#{proposal.title} | Reversim Summit 2014"
    {page: 'proposal', proposal: proposal}
