Template.agendaSessionDisplay.isSession = ->
  Proposal.find(String(@))

Template.agendaSessionDisplay.session = ->
  p = Proposal.find(String(@))
  if p then return p.title

