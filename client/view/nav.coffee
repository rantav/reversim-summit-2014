Template.nav.activeClass = (name) ->
  if @page == name then 'active' else ''

Template.nav.wishes = ->
  Wish.count()

Template.nav.proposals = ->
  Proposal.count()

Template.nav.speakers = ->
  User.allSpeakers().length