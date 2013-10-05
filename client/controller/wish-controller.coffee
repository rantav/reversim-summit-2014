class @WishController extends RouteController

  waitOn: -> [subscriptionHandles['wishes'], subscriptionHandles['users']]

  tempalte: 'wish'

  renderTemplates:
    'nav': to: 'nav'

  notFoundTemplate: 'notFound'

  data: ->
    wish = Wishes.findOne({_id: @params.id})
    if not wish then return null
    {page: 'wish', wish: wish}
