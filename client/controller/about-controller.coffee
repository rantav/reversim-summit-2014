class @AboutController extends RouteController

  onBeforeRun: ->
    if not subscriptionHandles.moderators
      subscriptionHandles.moderators = Meteor.subscribe('moderators')
      subscriptionHandles.moderators.stop = ->

  onAfterRun: ->
    document.title = "About Reversim Summit 2014"

  waitOn: ->
    subscriptionHandles.moderators

  tempalte: 'about'
  renderTemplates:
    'nav': to: 'nav'

  data: ->
    page: 'about'