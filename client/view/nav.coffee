Template.nav.activeClass = (name) ->
  if @page == name then 'active' else ''

Template.nav.wishes = ->
  Counts.findOne('wishes').count

Template.nav.proposals = ->
  Counts.findOne('proposals').count

Template.nav.speakers = ->
  Counts.findOne('speakers').count

Template.nav.users = ->
  User.count()

Template.nav.canSeeHidden = ->
  user = User.current()
  user and (user.admin() or user.moderator())