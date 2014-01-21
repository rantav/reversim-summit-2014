Template.agendaSessionDisplay.splits = ->
  if @ then @split(',')

Template.agendaSessionDisplay.isSession = ->
  !!Proposal.find(String(@))

Template.agendaSessionDisplay.session = ->
  Proposal.find(String(@))

Template.agendaSessionDisplay.speakers = ->
  @speakers()

Template.agendaSessionDisplay.photo = (user) ->
  user.photoUrl(40) if user

Template.agendaSessionDisplay.rendered = ->
  $(@findAll('[data-toggle="tooltip"]')).tooltip()

Template.agendaSessionDisplay.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')
