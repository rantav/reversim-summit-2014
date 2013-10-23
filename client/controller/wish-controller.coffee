class @WishController extends RouteController

  waitOn: ->
    subs = [subscriptionHandles.users]
    if not Wishes.findOne({_id: @params.id})
      s = Meteor.subscribe('wish', @params.id)
      s.stop = ->
      subs.push(s)
    subs

  tempalte: 'wish'

  renderTemplates:
    'nav': to: 'nav'

  notFoundTemplate: 'notFound'

  data: ->
    wish = Wishes.findOne({_id: @params.id})
    if not wish then return null
    {page: 'wish', wish: wish}
