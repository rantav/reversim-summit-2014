class @ProposeController extends RouteController

  run: ->
    u = Meteor.user()
    if u
      @render('login', to: 'login')
      @render('nav', to: 'nav', data: page: 'propose')
      @render('propose', to: 'main')
    else
      @render('nav', to: 'nav', data: page: 'propose')
      @render('pleaseLogin', to: 'main')

  data: -> null


