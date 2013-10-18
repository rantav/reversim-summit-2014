class @SpeakerController extends RouteController

  waitOn: -> [subscriptionHandles['proposals'], subscriptionHandles['speakers']]

  tempalte: 'speaker'

  renderTemplates:
    'nav': to: 'nav'

  notFoundTemplate: 'notFound'

  data: ->
    speaker = User.find(@params.id)
    if not speaker then return null
    {page: 'speaker', speaker: speaker}
