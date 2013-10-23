class @ProposalsController extends RouteController

  onBeforeRun: ->
    subscriptionHandles.proposals = Meteor.subscribe('proposals')
    subscriptionHandles.proposals.stop = ->

  waitOn: ->
    [subscriptionHandles.proposals, subscriptionHandles['users']]

  tempalte: 'proposals'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'proposals'