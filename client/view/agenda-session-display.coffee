Template.agendaSessionDisplay.isSessions = ->
  s = String(@)
  sessions = s.split(',')
  !!Proposal.find(sessions[0])

Template.agendaSessionDisplay.sessions = ->
  s = String(@)
  sessions = s.split(',')
  Proposal.where(_id: $in: sessions)

Template.agendaSessionDisplay.speakers = ->
  @speakers()

Template.agendaSessionDisplay.photo = (user) ->
  user.photoUrl(40) if user

Template.agendaSessionDisplay.rendered = ->
  $(@findAll('[data-toggle="tooltip"]')).tooltip()

Template.agendaSessionDisplay.destroyed = ->
  $('[data-toggle="tooltip"]').tooltip('destroy')
