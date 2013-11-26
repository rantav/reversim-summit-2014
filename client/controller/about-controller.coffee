class @AboutController extends RouteController

  before: ->
    if not subscriptionHandles.moderators
      subscriptionHandles.moderators = Meteor.subscribe('moderators')
      subscriptionHandles.moderators.stop = ->

  after: ->
    document.title = "About Reversim Summit 2014"

  waitOn: ->
    subscriptionHandles.moderators

  tempalte: 'about'

  data: ->
    page: 'about'