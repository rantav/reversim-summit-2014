class @AboutController extends RouteController

  onBeforeRun: ->
    subscriptionHandles.moderators = Meteor.subscribe('moderators')
    subscriptionHandles.moderators.stop = ->

  waitOn: ->
    subscriptionHandles.moderators


  tempalte: 'about'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'about'