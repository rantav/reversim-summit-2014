Router.map ->
  @route 'home', path: '/', controller: 'HomeController'
  @route 'propose', controller: 'ProposeController'

Router.configure
  layout: 'layout'
  loadingTemplate: 'loading'
