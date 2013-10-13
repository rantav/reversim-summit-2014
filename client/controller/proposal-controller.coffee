class @ProposalController extends RouteController

  waitOn: -> [subscriptionHandles['proposals'], subscriptionHandles['users']]

  tempalte: 'proposal'

  renderTemplates:
    'nav': to: 'nav'

  notFoundTemplate: 'notFound'

  data: ->
    proposal = Proposals.findOne({_id: @params.id})
    if not proposal then return null
    {page: 'proposal', proposal: proposal}
