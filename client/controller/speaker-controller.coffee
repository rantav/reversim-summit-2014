class @SpeakerController extends RouteController

  waitOn: ->
    subs = []
    if not subscriptionHandles.proposals
      subscriptionHandles.proposals = Meteor.subscribe('proposals')
      subscriptionHandles.proposals.stop = ->
      # subs.push(subscriptionHandles.proposals)

    if not User.find(@params.id)
      s = Meteor.subscribe('speaker', @params.id)
      s.stop = ->
      subs.push(s)
    subs

  tempalte: 'speaker'

  renderTemplates:
    'nav': to: 'nav'

  notFoundTemplate: 'notFound'

  data: ->
    speaker = User.find(@params.id)
    if not speaker then return null
    document.title = "#{speaker.name()} | Reversim Summit 2014"
    {page: 'speaker', speaker: speaker}
