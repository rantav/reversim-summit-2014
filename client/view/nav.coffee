Template.nav.activeClass = (name) ->
  if @page == name then 'active' else ''

Template.nav.wishes = ->
  Wish.count()

Template.nav.proposals = ->
  Proposal.count()

Template.nav.speakers = ->
  User.allSpeakers().length

Template.nav.users = ->
  User.count()

Template.nav.canSeeHidden = ->
  user = User.current()
  user and (user.admin() or user.moderator())