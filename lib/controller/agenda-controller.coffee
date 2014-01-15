class @AgendaController extends FastRender.RouteController

  after: -> document.title = "Agenda | Reversim Summit 2014"

  waitOn: -> Meteor.subscribe('agenda')

  tempalte: 'agenda'

  data: ->
    page: 'agenda'
    items: AgendaItem.all()