class @WishController extends RouteController

  waitOn: -> [subscriptionHandles['wishes'], subscriptionHandles['users']]

  renderTemplates:
    'nav': to: 'nav'
    'wish': to: 'main'

  notFoundTemplate: 'notFound'

  data: ->
    wish = Wishes.findOne({_id: @params.id})
    if not wish then return null
    {page: 'wish', wish: wish}
