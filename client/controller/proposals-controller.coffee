class @ProposalsController extends RouteController

  waitOn: ->
    subs = [subscriptionHandles.users]
    if not subscriptionHandles.proposals
      subscriptionHandles.proposals = Meteor.subscribe('proposals')
      subscriptionHandles.proposals.stop = ->
      subs.push(subscriptionHandles.proposals)
    subs

  onAfterRun: ->
    document.title = "Proposals | Reversim Summit 2014"

  tempalte: 'proposals'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'proposals'