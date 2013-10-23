class @SpeakersController extends RouteController

  waitOn: ->
    [Meteor.subscribe('proposals'), Meteor.subscribe('speakers')]

  tempalte: 'speakers'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'speakers'