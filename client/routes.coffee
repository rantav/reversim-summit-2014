Router.map ->
  @route 'home', path: '/', controller: 'HomeController'
  @route 'propose', controller: 'ProposeController'
  @route 'wish', controller: 'WishController'

Router.configure
  layout: 'layout'
  loadingTemplate: 'loading'
