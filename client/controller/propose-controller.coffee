class @ProposeController extends RouteController

  run: ->
    u = Meteor.user()
    if u
      @render('propose')
    else
      @render('pleaseLogin')



  data: ->
    {}


