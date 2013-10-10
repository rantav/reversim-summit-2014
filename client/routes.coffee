Router.map ->
  @route 'home', path: '/', controller: 'HomeController'
  @route 'about', path: '/about', controller: 'AboutController'
  @route 'propose', controller: 'ProposeController'
  @route 'wishes', controller: 'WishesController'
  @route 'wish', path: '/wish/:id', controller: 'WishController'
  @route 's2013', path: '/s2013', controller: 'S2013Controller'

Router.configure
  layout: 'layout'
  loadingTemplate: 'loading'


Deps.autorun ->
  Router.current()
  Deps.afterFlush ->
    $(window).scrollTop(0)
