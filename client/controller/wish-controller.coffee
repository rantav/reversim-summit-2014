class @WishController extends RouteController

  waitOn: -> subscriptionHandles['wishes']

  run: ->
    u = Meteor.user()
    if u
      @render('login', to: 'login')
      @render('nav', to: 'nav', data: page: 'wish')
      @render('wish', to: 'main')
    else
      @render('nav', to: 'nav', data: page: 'propose')
      @render('wish', to: 'main')

