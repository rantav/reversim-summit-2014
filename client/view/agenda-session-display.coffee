Template.agendaSessionDisplay.isSession = ->
  Proposal.find(String(@))

Template.agendaSessionDisplay.session = ->
  Proposal.find(String(@)).title
