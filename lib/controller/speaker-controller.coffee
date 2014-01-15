class @SpeakerController extends FastRender.RouteController

  waitOn: -> Meteor.subscribe('speakers', {_id: @params.id})

  tempalte: 'speaker'

  notFoundTemplate: 'notFound'

  data: ->
    speaker = User.find(@params.id)
    if not speaker then return null
    document.title = "#{speaker.name()} | Reversim Summit 2014"
    {page: 'speaker', speaker: speaker}
