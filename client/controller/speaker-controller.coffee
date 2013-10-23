class @SpeakerController extends RouteController

  waitOn: -> [Meteor.subscribe('proposals'), Meteor.subscribe('speaker', @params.id)]

  tempalte: 'speaker'

  renderTemplates:
    'nav': to: 'nav'

  notFoundTemplate: 'notFound'

  data: ->
    speaker = User.find(@params.id)
    if not speaker then return null
    {page: 'speaker', speaker: speaker}
