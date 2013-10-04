class @ProposeController extends RouteController

  run: ->
    u = Meteor.user()
    if u
      @render('nav', to: 'nav')
      @render('propose', to: 'main')
    else
      @render('nav', to: 'nav')
      @render('pleaseLogin', to: 'main')

  data: ->
    page: 'propose'


