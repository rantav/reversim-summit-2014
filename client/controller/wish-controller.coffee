class @WishController extends RouteController

  waitOn: -> [subscriptionHandles['wishes'], subscriptionHandles['users']]

  run: ->
    u = Meteor.user()
    if u
      @render('nav', to: 'nav')
      @render('wish', to: 'main')
    else
      @render('nav', to: 'nav')
      @render('wish', to: 'main')

  data: ->
    page: 'wish'