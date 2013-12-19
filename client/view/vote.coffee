Template.vote.speakers = -> @speakers

statuses = ['submitted']
Template.vote.shouldDisplay = (speaker) ->
  speaker.hasProposalInStatus(statuses)

Template.vote.photo = (speaker) ->
  speaker.photoUrl(120)

Template.vote.proposals = -> @proposals()

Template.vote.filterByTypeUrl = ->
  Router.path('vote') + "?filterType=#{@type}"

Template.vote.filterByTagUrl = ->
  Router.path('vote') + "?filterTag=#{@}"

Template.vote.canSeeResults = ->
  u = User.current()
  u and (u.admin() or u.moderator())

Template.vote.events
  'click .sign-in': ->
    Accounts._loginButtonsSession.set('dropdownVisible', true);
