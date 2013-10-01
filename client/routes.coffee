Router.map ->
  @route 'home', path: '/'
  @route 'propose', path: '/propose'

Router.configure
  layout: 'layout'
  loadingTemplate: 'loading'
