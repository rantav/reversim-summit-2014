class @AboutController extends RouteController

  waitOn: ->
    Meteor.subscribe('moderators')


  tempalte: 'about'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'about'