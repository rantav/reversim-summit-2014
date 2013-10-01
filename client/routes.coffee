Router.map ->
  @route 'home', path: '/'
  @route 'propose', controller: 'ProposeController'

Router.configure
  layout: 'layout'
  loadingTemplate: 'loading'
