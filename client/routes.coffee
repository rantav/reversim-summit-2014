Router.map ->
  @route 'home', path: '/', controller: 'HomeController'
  @route 'propose', controller: 'ProposeController'
  @route 'wishes', controller: 'WishesController'

Router.configure
  layout: 'layout'
  loadingTemplate: 'loading'
