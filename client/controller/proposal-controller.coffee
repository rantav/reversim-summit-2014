class @ProposalController extends RouteController

  waitOn: ->
    subs = [subscriptionHandles.users]
    if not Proposal.find(@params.id)
      s = Meteor.subscribe('proposal', @params.id)
      s.stop = ->
      subs.push(s)
    subs


  tempalte: 'proposal'

  renderTemplates:
    'nav': to: 'nav'

  notFoundTemplate: 'notFound'

  data: ->
    proposal = Proposal.find(@params.id)
    if not proposal then return null
    {page: 'proposal', proposal: proposal}
