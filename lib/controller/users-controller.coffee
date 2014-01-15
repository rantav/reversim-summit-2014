class @UsersController extends FastRender.RouteController

  waitOn: -> Meteor.subscribe('users')

  after: -> document.title = "Users | Reversim Summit 2014"

  tempalte: 'users'

  data: ->
    page: 'users'

