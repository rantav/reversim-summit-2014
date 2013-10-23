class @SpeakersController extends RouteController

  waitOn: ->
    subs = []
    if not subscriptionHandles.proposals
      subscriptionHandles.proposals = Meteor.subscribe('proposals')
      subscriptionHandles.proposals.stop = ->
      subs.push(subscriptionHandles.proposals)
    if not subscriptionHandles.speakers
      subscriptionHandles.speakers = Meteor.subscribe('speakers')
      subscriptionHandles.speakers.stop = ->
      subs.push(subscriptionHandles.speakers)
    subs

  tempalte: 'speakers'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'speakers'