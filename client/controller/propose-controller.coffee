class @ProposeController extends RouteController
  waitOn: -> Meteor.subscribe('users')
  template: 'propose'

  after: -> document.title = "Propose | Reversim Summit 2014"

  data: ->
    page: 'propose'


