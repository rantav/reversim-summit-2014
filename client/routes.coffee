Router.map ->
  @route 'home', path: '/', controller: 'HomeController'
  @route 'about', path: '/about', controller: 'AboutController'
  @route 'propose', controller: 'ProposeController'
  @route 'wishes', controller: 'WishesController'
  @route 'proposal', path: '/proposal/:id/:title?', controller: 'ProposalController'
  @route 'proposals', controller: 'ProposalsController'
  @route 'wish', path: '/wish/:id/:title?', controller: 'WishController'
  @route 's2013', path: '/s2013', controller: 'S2013Controller'
  @route 'venue', path: '/venue', controller: 'VenueController'

Router.configure
  layout: 'layout'
  loadingTemplate: 'loading'


Deps.autorun ->
  Router.current()
  Deps.afterFlush ->
    $(window).scrollTop(0)
