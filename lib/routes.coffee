filters =
  nProgressHook: ->
    if @ready()
      NProgress.done()
    else
      NProgress.start()
      @stop()

  resetScroll: ->
    scrollTo = window.currentScroll || 0;
    $('body').scrollTop(scrollTo);
    $('body').css("min-height", 0);

Router.before(filters.nProgressHook, {only: [
  'wish'
  'wishes',
  'proposal',
  'proposals',
  'speaker',
  'speakers',
  'sponsors',
  'about',
  'vote',
  'agenda'
]})

Router.after(filters.resetScroll, {except:['wishes', 'proposals', 'speakers', 'vote']});

Router.map ->
  @route 'home', path: '/', action: -> @redirect('agenda')
  # @route 'home', path: '/', controller: 'HomeController'
  @route 'about', path: '/about', controller: 'AboutController'
  @route 'register', path: '/register', controller: 'RegisterController'
  @route 'propose', controller: 'ProposeController'
  @route 'wishes', controller: 'WishesController'
  @route 'agenda', path: '/agenda', controller: 'AgendaController'
  @route 'proposal', path: '/proposal/:id/:title(*)?', controller: 'ProposalController'
  @route 'proposal', path: '/proposal/:id', controller: 'ProposalController'
  @route 'proposals', path: '/proposals/:limit?', controller: 'ProposalsController'
  @route 'vote', path: '/vote', controller: 'VoteController'
  @route 'speaker', path: '/speaker/:id/:name(*)?', controller: 'SpeakerController'
  @route 'speakers', controller: 'SpeakersController'
  @route 'users', controller: 'UsersController'
  @route 'user', template: 'speaker', path: '/user/:id/:name(*)?', controller: 'SpeakerController'
  @route 'wish', path: '/wish/:id/:title(*)?', controller: 'WishController'
  @route 's2013', path: '/s2013', controller: 'S2013Controller'
  @route 'info', path: '/info', controller: 'InfoController'
  @route 'coc', path: '/coc', controller: 'CocController'
  @route 'sponsors', controller: 'SponsorsController'
  @route 'community', path: '/community', controller: 'CommunityController'

Router.configure
  layoutTemplate: 'layout'
  yieldTemplates:
    'nav': to: 'nav'

Router.fullPath = (routeName, params) ->
  Meteor.absoluteUrl().slice(0, -1) + Router.path(routeName, params)