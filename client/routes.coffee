Router.map ->
  @route 'home', path: '/'

Router.configure
  layout: 'layout'
  loadingTemplate: 'loading'
